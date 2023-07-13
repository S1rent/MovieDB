//
//  MovieGenreEntity.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation

public struct MovieGenreResponseWrapper: Decodable {
    let genres: [MovieGenre]?
    
    internal enum CodingKeys: String, CodingKey {
        case genres = "genres"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.genres = try values.decodeIfPresent([MovieGenre].self, forKey: .genres)
    }
}

public struct MovieGenre: Decodable {
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
