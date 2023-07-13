//
//  MovieGenreListViewController.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import UIKit
import RxSwift
import RxCocoa

class MovieGenreListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let disposeBag: DisposeBag
    private let presenter: MovieGenrePresenter
    
    init(presenter: MovieGenrePresenter) {
        self.disposeBag = DisposeBag()
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupCollectionView()
        self.bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func bindUI() {
        self.disposeBag.insert(
            presenter.getTrendingMovies()
                .drive(self.collectionView.rx.items(cellIdentifier: MovieGenreCollectionViewCell.identifier, cellType: MovieGenreCollectionViewCell.self)) { [weak self] _, data, cell in
                    guard let self = self else { return }
                cell.setData(data, callback: self.collectionViewCellTapHandler)
            }
        )
    }
    
    private func setupCollectionView() {
        self.collectionView.register(MovieGenreCollectionViewCell.nib, forCellWithReuseIdentifier: MovieGenreCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout ?? UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 48, left: 0, bottom: 48, right: 0)
        layout.itemSize = CGSize(width: (self.collectionView.frame.width / 2), height: 75)
        self.collectionView.setCollectionViewLayout(layout, animated: true)
        
        self.collectionView.allowsSelection = false
        self.collectionView.reloadData()
    }
    
    public func collectionViewCellTapHandler(_ data: MovieGenre) {
        print(data)
    }
}
