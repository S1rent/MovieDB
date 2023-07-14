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
    func navigateToMovieList(movieGenre: MovieGenre) -> Void
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
    
    public func navigateToMovieList(movieGenre: MovieGenre) {
        let viewController = MovieRouter.createMovieListModule(movieGenre: movieGenre)
        
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
}
