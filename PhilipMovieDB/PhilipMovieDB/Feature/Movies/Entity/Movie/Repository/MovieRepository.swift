//
//  MovieRepository.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

protocol MovieDataSourceProtocol {
    func getMovieGenre() -> Driver<[MovieGenre]>
    func getMoviesByGenre(genreId: Int) -> Driver<[Movie]>
    func getMovieDetail(movieId: Int) -> Driver<MovieDetail?>
    func getMovieDetailVideo(movieId: Int) -> Driver<[MovieDetailVideo]>
    func getMovieDetailReview(movieId: Int) -> Driver<[MovieDetailReview]>
}

final class MovieDataSource {
    let provider: MoyaProvider<MovieTarget>
    
    static let shared: MovieDataSource = MovieDataSource()
    
    private init() {
        self.provider = MoyaProvider<MovieTarget>()
    }
}

extension MovieDataSource: MovieDataSourceProtocol {
    func getMovieGenre() -> Driver<[MovieGenre]> {
        let requestToken = MovieTarget.getMovieGenre
        
        return self.provider.rx
            .request(requestToken)
            .map(MovieGenreResponseWrapper.self)
            .map {
                $0.genres ?? []
            }
            .asDriver(onErrorJustReturn: [])
    }
    
    func getMoviesByGenre(genreId: Int) -> Driver<[Movie]> {
        // page idnya langsung dari sini aja
        let requestToken = MovieTarget.getMoviesByGenre(page: 1, genreId: genreId)
        
        return self.provider.rx
            .request(requestToken)
            .map(MovieResponseWrapper.self)
            .map {
                $0.results ?? []
            }
            .asDriver(onErrorJustReturn: [])
    }
    
    func getMovieDetail(movieId: Int) -> Driver<MovieDetail?> {
        let requestToken = MovieTarget.getMovieDetail(movieId: movieId)
        
        return self.provider.rx
            .request(requestToken)
            .map(MovieDetail.self)
            .map {
                $0
            }
            .asDriver(onErrorJustReturn: nil)
    }
    
    func getMovieDetailVideo(movieId: Int) -> Driver<[MovieDetailVideo]> {
        let requestToken = MovieTarget.getMovieDetailVideo(movieId: movieId)
        
        return self.provider.rx
            .request(requestToken)
            .map(MovieDetailVideoResponseWrapper.self)
            .map {
                $0.results ?? []
            }
            .asDriver(onErrorJustReturn: [])
    }
    
    func getMovieDetailReview(movieId: Int) -> Driver<[MovieDetailReview]> {
        // page idnya langsung dari sini aja
        let requestToken = MovieTarget.getMovieDetailReview(page: 1, movieId: movieId)
        
        return self.provider.rx
            .request(requestToken)
            .map(MovieDetailReviewResponseWrapper.self)
            .map {
                $0.results ?? []
            }
            .asDriver(onErrorJustReturn: [])
    }
}
