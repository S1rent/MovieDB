//
//  MovieInteractor.swift
//  PhilipMovieDB
//
//  Created by IT Division on 14/07/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol MovieListUseCase {
    func getMoviesByGenre(genreId: Int, loadTrigger: Driver<Void>) -> Driver<[Movie]>
}

public class MovieListInteractor: MovieListUseCase {
    let repository: MovieDataSourceProtocol
    
    required init(
        repository: MovieDataSourceProtocol
    ) {
        self.repository = repository
    }
    
    func getMoviesByGenre(genreId: Int, loadTrigger: Driver<Void>) -> Driver<[Movie]> {
        repository.getMoviesByGenre(genreId: genreId, loadTrigger: loadTrigger)
    }
}
