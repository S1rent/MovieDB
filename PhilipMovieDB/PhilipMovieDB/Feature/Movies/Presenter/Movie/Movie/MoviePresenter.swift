//
//  MoviePresenter.swift
//  PhilipMovieDB
//
//  Created by IT Division on 14/07/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol MovieListPresenterUseCase {
    func getMoviesByGenre(genreId: Int) -> Driver<[Movie]>
}

class MovieListPresenter: MovieListPresenterUseCase {
    private let router: MovieRouter
    private let useCase: MovieListUseCase
  
    init(
        useCase: MovieListUseCase,
        router: MovieRouter
    ) {
        self.useCase = useCase
        self.router = router
    }
  
    func getMoviesByGenre(genreId: Int) -> Driver<[Movie]> {
        return useCase.getMoviesByGenre(genreId: genreId)
    }
}
