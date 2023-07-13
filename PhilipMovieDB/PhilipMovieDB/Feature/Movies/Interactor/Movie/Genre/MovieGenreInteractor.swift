//
//  MovieGenreInteractor.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol MovieGenreUseCase {
    func getTrendingMovies() -> Driver<[MovieGenre]>
}

public class MovieGenreInteractor: MovieGenreUseCase {
    let repository: MovieDataSourceProtocol
    
    required init(
        repository: MovieDataSourceProtocol
    ) {
        self.repository = repository
    }
    
    func getTrendingMovies() -> Driver<[MovieGenre]> {
        return repository.getMovieGenre()
    }
}
