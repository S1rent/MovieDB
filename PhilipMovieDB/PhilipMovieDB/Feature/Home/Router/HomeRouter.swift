//
//  HomeRouter.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation
import UIKit

protocol HomeRouterProtocol {
    static func createHomeModule() -> HomeViewController 
    func navigateToMovieGenreList() -> Void
}

class HomeRouter: HomeRouterProtocol {
    public static let shared = HomeRouter()
    
    private init() { }
    
    public static func createHomeModule() -> HomeViewController {
        let presenter = HomePresenter(router: HomeRouter.shared)
        let viewController = HomeViewController(presenter: presenter)
        
        return viewController
    }
    
    public func navigateToMovieGenreList() {
        let viewController = MovieRouter.createMovieGenreModule()
        
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
}
