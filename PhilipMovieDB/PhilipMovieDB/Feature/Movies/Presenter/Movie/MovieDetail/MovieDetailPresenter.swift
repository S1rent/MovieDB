//
//  MovieDetailPresenter.swift
//  PhilipMovieDB
//
//  Created by IT Division on 15/07/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol MovieDetailPresenterUseCase {
    func getMovieDetail(movieId: Int) -> Driver<MovieDetail?>
    func getMovieDetailVideo(movieId: Int) -> Driver<[MovieDetailVideo]>
    func getMovieDetailReview(movieId: Int, loadTrigger: Driver<Void>) -> Driver<[MovieDetailReview]>
}

class MovieDetailPresenter: MovieDetailPresenterUseCase {
    private let router: MovieRouter
    private let useCase: MovieDetailUseCase
  
    init(
        useCase: MovieDetailUseCase,
        router: MovieRouter
    ) {
        self.useCase = useCase
        self.router = router
    }
  
    func getMovieDetail(movieId: Int) -> Driver<MovieDetail?> {
        return useCase.getMovieDetail(movieId: movieId)
    }
    
    func getMovieDetailVideo(movieId: Int) -> Driver<[MovieDetailVideo]> {
        return useCase.getMovieDetailVideo(movieId: movieId)
    }
    
    func getMovieDetailReview(movieId: Int, loadTrigger: Driver<Void>) -> Driver<[MovieDetailReview]> {
        return useCase.getMovieDetailReview(movieId: movieId, loadTrigger: loadTrigger)
    }
}
