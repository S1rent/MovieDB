//
//  MovieRouter.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation
import UIKit

protocol MovieRouterProtocol {
    static func createMovieGenreModule() -> MovieGenreListViewController
    static func createMovieListModule(movieGenre: MovieGenre) -> MovieListTableViewController
    static func createMovieDetailModule(movie: Movie) -> MovieDetailViewController
    func navigateToMovieList(movieGenre: MovieGenre) -> Void
    func navigateToMovieDetail(movie: Movie) -> Void
}

class MovieRouter: MovieRouterProtocol {
    public static let shared = MovieRouter()
    
    private init() { }
    
    public static func createMovieGenreModule() -> MovieGenreListViewController {
        
        let repository = MovieDataSource.shared
        let interactor = MovieGenreInteractor(repository: repository)
        let presenter = MovieGenrePresenter(useCase: interactor, router: MovieRouter())
        let viewController = MovieGenreListViewController(presenter: presenter)
        
        return viewController
    }
    
    public static func createMovieListModule(movieGenre: MovieGenre) -> MovieListTableViewController {
        
        let repository = MovieDataSource.shared
        let interactor = MovieListInteractor(repository: repository)
        let presenter = MovieListPresenter(useCase: interactor, router: MovieRouter())
        let viewController = MovieListTableViewController(presenter: presenter, movieGenre: movieGenre)
        
        return viewController
    }
    
    public static func createMovieDetailModule(movie: Movie) -> MovieDetailViewController {
        
        let repository = MovieDataSource.shared
        let interactor = MovieDetailInteractor(repository: repository)
        let presenter = MovieDetailPresenter(useCase: interactor, router: MovieRouter())
        let viewController = MovieDetailViewController(presenter: presenter, movie: movie)
        
        return viewController
    }
    
    public func navigateToMovieList(movieGenre: MovieGenre) {
        let viewController = MovieRouter.createMovieListModule(movieGenre: movieGenre)
        
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    public func navigateToMovieDetail(movie: Movie) {
        let viewController = MovieRouter.createMovieDetailModule(movie: movie)

        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
}
