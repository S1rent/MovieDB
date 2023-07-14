//
//  MovieDetailViewController.swift
//  PhilipMovieDB
//
//  Created by IT Division on 15/07/23.
//

import UIKit
import RxSwift
import RxCocoa
import youtube_ios_player_helper
import SDWebImage

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var overviewGradientView: GradientView!
    @IBOutlet weak var labelMovieTitle: UILabel!
    @IBOutlet weak var labelOverview: UILabel!
    @IBOutlet weak var labelReleaseDate: UILabel!
    @IBOutlet weak var labelRuntime: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var ageRestrictionView: UIView!
    @IBOutlet weak var labelAgeRestriction: UILabel!
    @IBOutlet weak var labelTags: UILabel!
    @IBOutlet weak var youtubePlayerView: YTPlayerView!
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageVerticalPoster: UIImageView!
    
    @IBOutlet weak var youtubePlayerViewHeightConstant: NSLayoutConstraint!
    
    private let presenter: MovieDetailPresenter
    private let disposeBag: DisposeBag
    private let movie: Movie
    
    init(presenter: MovieDetailPresenter, movie: Movie) {
        self.disposeBag = DisposeBag()
        self.presenter = presenter
        self.movie = movie
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.title = movie.title ?? "-"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.bindUI()
    }
    
    private func setupView() {
        self.ageRestrictionView.layer.cornerRadius = 4
        self.overviewGradientView.layer.cornerRadius = 8
        
        let randomGradientColor = CAGradientLayer.randomGradientUIColor()
        self.overviewGradientView.startColor = randomGradientColor[0]
        self.overviewGradientView.endColor = randomGradientColor[1]
        self.overviewGradientView.updateColors()
        self.imageVerticalPoster.layer.cornerRadius = 8
        self.imageVerticalPoster.sd_imageIndicator = SDWebImageActivityIndicator.white
        self.imagePoster.sd_imageIndicator = SDWebImageActivityIndicator.white
    }
    
    private func bindUI() {
        self.disposeBag.insert(
            presenter.getMovieDetail(movieId: movie.id ?? 1).drive(onNext: { [weak self] data in
                guard let self = self else { return }
                
                if let safeData = data {
                    self.setData(safeData)
                }
            }),
            presenter.getMovieDetailVideo(movieId: movie.id ?? 1).drive(onNext: { [weak self] data in
                guard let self = self else { return }
                
                self.setVideoData(data)
            })
        )
    }
    
    private func setData(_ data: MovieDetail) {
        self.labelMovieTitle.text = data.title ?? "-"
        self.labelRating.text = "\(data.voteAverage ?? 0)"
        self.labelOverview.text = data.overview ?? "-"
        self.labelAgeRestriction.text = (data.adult ?? false) ? "R13+" : "G"
        self.ageRestrictionView.backgroundColor = (data.adult ?? false) ? UIColor.red : UIColor.green
        self.imagePoster?.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(data.posterPath ?? "-")"))
        self.imageVerticalPoster?.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(data.backdropPath ?? "-")"))
        if (data.overview ?? "").isEmpty {
            self.overviewGradientView.isHidden = true
        }

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: data.releaseDate ?? "0001-01-01")!
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        self.labelReleaseDate.text = dateFormatter.string(from: date)
        
        var genreString = ""
        for (idx, genre) in (data.genres ?? []).enumerated() {
            genreString += ((genre.name ?? "-") + ((idx != (data.genres ?? []).count - 1) ? ", " : ""))
        }
        self.labelTags.text = genreString
        self.labelRuntime.text = "\((data.runtime ?? 0) / 60) Hour, \((data.runtime ?? 0) % 60) Minute\(((data.runtime ?? 0) % 60) == 1 ? "s" : "")"
    }
    
    private func setVideoData(_ data: [MovieDetailVideo]) {
        if data.isEmpty {
            self.youtubePlayerView.isHidden = true
            self.youtubePlayerViewHeightConstant.constant = 0
        } else {
            let ytKey = data[0].key ?? "-"
            self.youtubePlayerView.load(withVideoId: ytKey)
        }
    }
}
