//
//  MovieGenrePresenter.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation
import RxSwift
import RxCocoa

class MovieGenrePresenter: MovieGenreUseCase {
    
    private let router: MovieRouter
    private let useCase: MovieGenreUseCase
  
    init(
        useCase: MovieGenreUseCase,
        router: MovieRouter
    ) {
        self.useCase = useCase
        self.router = router
    }
  
    func getTrendingMovies() -> Driver<[MovieGenre]> {
        return useCase.getTrendingMovies()
    }
}
