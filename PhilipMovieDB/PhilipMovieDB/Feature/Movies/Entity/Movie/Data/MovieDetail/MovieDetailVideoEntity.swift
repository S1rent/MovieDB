//
//  MovieDetailVideoEntity.swift
//  PhilipMovieDB
//
//  Created by IT Division on 15/07/23.
//

import Foundation

public struct MovieDetailVideoResponseWrapper: Decodable {
    let id: Int?
    let results: [MovieDetailVideo]?
    
    internal enum CodingKeys: String, CodingKey {
        case id = "id"
        case results = "results"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.results = try values.decodeIfPresent([MovieDetailVideo].self, forKey: .results)
    }
}

public struct MovieDetailVideo: Decodable {
    let key: String?
    
    internal enum CodingKeys: String, CodingKey {
        case key = "key"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.key = try values.decodeIfPresent(String.self, forKey: .key)
    }
}
