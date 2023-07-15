//
//  MovieDetailInteractor.swift
//  PhilipMovieDB
//
//  Created by IT Division on 15/07/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol MovieDetailUseCase {
    func getMovieDetail(movieId: Int) -> Driver<MovieDetail?>
    func getMovieDetailVideo(movieId: Int) -> Driver<[MovieDetailVideo]>
    func getMovieDetailReview(movieId: Int, loadTrigger: Driver<Void>) -> Driver<[MovieDetailReview]>
}

public class MovieDetailInteractor: MovieDetailUseCase {
    let repository: MovieDataSourceProtocol
    
    required init(
        repository: MovieDataSourceProtocol
    ) {
        self.repository = repository
    }
    
    func getMovieDetail(movieId: Int) -> Driver<MovieDetail?> {
        return repository.getMovieDetail(movieId: movieId)
    }
    
    func getMovieDetailVideo(movieId: Int) -> Driver<[MovieDetailVideo]> {
        return repository.getMovieDetailVideo(movieId: movieId)
    }
    
    func getMovieDetailReview(movieId: Int, loadTrigger: Driver<Void>) -> Driver<[MovieDetailReview]> {
        return repository.getMovieDetailReview(movieId: movieId, loadTrigger: loadTrigger)
    }
}
