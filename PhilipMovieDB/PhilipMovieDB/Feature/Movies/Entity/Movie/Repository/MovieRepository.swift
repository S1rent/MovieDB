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
        print("Testing sampe sini")
        return self.provider.rx
            .request(requestToken)
            .map(MovieGenreResponseWrapper.self)
            .map {
                $0.genres ?? []
            }
            .asDriver(onErrorJustReturn: [])
    }
}
