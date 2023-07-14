//
//  MovieDetailEntity.swift
//  PhilipMovieDB
//
//  Created by IT Division on 15/07/23.
//

import Foundation

public struct MovieDetail: Decodable {
    let id: Int?
    let backdropPath: String?
    let posterPath: String?
    let genres: [MovieGenre]?
    let overview: String?
    let releaseDate: String?
    let runtime: Int?
    let voteAverage: Double?
    let title: String?
    let adult: Bool?
    
    internal enum CodingKeys: String, CodingKey {
        case id = "id"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case genres = "genres"
        case overview = "overview"
        case releaseDate = "release_date"
        case runtime = "runtime"
        case voteAverage = "vote_average"
        case title = "original_title"
        case adult = "adult"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
        self.backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        self.posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        self.releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        self.overview = try values.decodeIfPresent(String.self, forKey: .overview)
        self.title = try values.decodeIfPresent(String.self, forKey: .title)
        self.genres = try values.decodeIfPresent([MovieGenre].self, forKey: .genres)
        self.voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
        self.adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
    }
}

public struct MovieDetailGenre: Decodable {
    let id: Int?
    let name: String?
    
    internal enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
