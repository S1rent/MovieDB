//
//  HomePresenter.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation

protocol HomePresenterUseCase {
    func navigateToMovieGenreList() -> Void
}

class HomePresenter: HomePresenterUseCase {
    private let router: HomeRouter
  
    init(
        router: HomeRouter
    ) {
        self.router = router
    }
    
    func navigateToMovieGenreList() {
        self.router.navigateToMovieGenreList()
    }
}
