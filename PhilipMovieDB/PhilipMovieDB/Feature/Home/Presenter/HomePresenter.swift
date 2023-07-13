//
//  HomePresenter.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation

protocol HomeUseCase {
    func navigateToMovieGenreList() -> Void
}

class HomePresenter: HomeUseCase {
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
