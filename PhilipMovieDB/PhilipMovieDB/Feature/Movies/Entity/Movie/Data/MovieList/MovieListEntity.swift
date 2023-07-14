//
//  MovieEntity.swift
//  PhilipMovieDB
//
//  Created by IT Division on 14/07/23.
//

import Foundation

public struct MovieResponseWrapper: Decodable {
    let results: [Movie]?
    
    internal enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.results = try values.decodeIfPresent([Movie].self, forKey: .results)
    }
}

public struct Movie: Decodable {
    let id: Int?
    let backdropPath: String?
    let posterPath: String?
    let voteCount: Double?
    let voteAverage: Double?
    let title: String?
    let overview: String?
    let adult: Bool?
    let releaseDate: String?
    
    internal enum CodingKeys: String, CodingKey {
        case id = "id"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case title = "original_title"
        case overview = "overview"
        case adult = "adult"
        case releaseDate = "release_date"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        self.posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        self.voteCount = try values.decodeIfPresent(Double.self, forKey: .voteCount)
        self.voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
        self.title = try values.decodeIfPresent(String.self, forKey: .title)
        self.overview = try values.decodeIfPresent(String.self, forKey: .overview)
        self.adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        self.releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
    }
}
