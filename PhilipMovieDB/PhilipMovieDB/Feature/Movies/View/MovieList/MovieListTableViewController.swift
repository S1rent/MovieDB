//
//  MovieListTableViewController.swift
//  PhilipMovieDB
//
//  Created by IT Division on 14/07/23.
//

import UIKit
import RxSwift
import RxCocoa

class MovieListTableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag: DisposeBag
    private let presenter: MovieListPresenterUseCase
    private let movieGenre: MovieGenre
    private let loadTrigger: BehaviorRelay<Void>
    
    init(presenter: MovieListPresenter, movieGenre: MovieGenre) {
        self.disposeBag = DisposeBag()
        self.presenter = presenter
        self.movieGenre = movieGenre
        self.loadTrigger = BehaviorRelay(value: ())
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.title = "\(movieGenre.name ?? "-") Genre"
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        self.bindUI()
    }
    
    private func bindUI() {
        self.disposeBag.insert(
            presenter.getMoviesByGenre(genreId: movieGenre.id ?? 1, loadTrigger: self.loadTrigger.asDriver().debounce(RxTimeInterval.milliseconds(500 ))).drive(tableView.rx.items(cellIdentifier: MovieListTableViewCell.identifier, cellType: MovieListTableViewCell.self)) {[weak self] _, data, cell in
                guard let self = self else { return }
                
                cell.setData(data, self.movieGenre.name ?? "-")
                cell.selectionStyle = .none
            },
            self.tableView.rx.modelSelected(Movie.self).asDriver().drive(onNext: { [weak self] data in
                guard let self = self else { return }
                self.presenter.navigateToMovieDetail(movie: data)
            })
        )
    }
    
    private func setupTableView() {
        self.tableView.register(MovieListTableViewCell.nib, forCellReuseIdentifier: MovieListTableViewCell.identifier)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 180
        self.tableView.allowsSelection = true
        self.tableView.delegate = self
    }
}

extension MovieListTableViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYOffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYOffset

        if distanceFromBottom < height {
            print("You reached end of the table")
            self.loadTrigger.accept(())
        }
    }
}
