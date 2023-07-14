//
//  MovieListTableViewCell.swift
//  PhilipMovieDB
//
//  Created by IT Division on 14/07/23.
//

import UIKit
import SDWebImage

class MovieListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var labelMovieTitle: UILabel!
    @IBOutlet weak var labelAgeRestriction: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var overviewGradientView: GradientView!
    @IBOutlet weak var labelOverview: UILabel!
    @IBOutlet weak var ageRestrictionView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
        self.ageRestrictionView.layer.cornerRadius = 4
        self.overviewGradientView.layer.cornerRadius = 8
        
        let randomGradientColor = CAGradientLayer.randomGradientUIColor()
        self.overviewGradientView.startColor = randomGradientColor[0]
        self.overviewGradientView.endColor = randomGradientColor[1]
        self.overviewGradientView.updateColors()
        self.imageMovie.layer.cornerRadius = 8
        self.imageMovie.sd_imageIndicator = SDWebImageActivityIndicator.white
    }
    
    public func setData(_ data: Movie, _ genreName: String) {
        self.labelMovieTitle.text = data.title ?? "-"
        self.labelGenre.text = genreName
        self.labelRating.text = "\(data.voteCount ?? 0)"
        self.labelOverview.text = data.overview ?? "-"
        self.labelAgeRestriction.text = (data.adult ?? false) ? "R13+" : "G"
        self.ageRestrictionView.backgroundColor = (data.adult ?? false) ? UIColor.red : UIColor.green
        self.imageMovie?.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(data.backdropPath ?? "-")"))
        if (data.overview ?? "").isEmpty {
            self.overviewGradientView.isHidden = true
        }
    }

}
