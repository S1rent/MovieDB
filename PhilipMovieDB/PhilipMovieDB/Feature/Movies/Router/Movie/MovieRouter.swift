//
//  MovieRouter.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation
import UIKit

protocol MovieRouterProtocol {
    func navigateToMovieList(genreId: Int) -> Void
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
    
    public func navigateToMovieList(genreId: Int) {
//        let viewController = CategoryTableViewController(isSelectCategory: isSelectCategory)
        
        UIApplication.topViewController()?.navigationController?.pushViewController(UIViewController(), animated: true)
    }
}
