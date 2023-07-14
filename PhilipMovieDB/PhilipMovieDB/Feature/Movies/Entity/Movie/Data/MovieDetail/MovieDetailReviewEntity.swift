//
//  MovieDetailUserReviewEntity.swift
//  PhilipMovieDB
//
//  Created by IT Division on 15/07/23.
//

import Foundation

public struct MovieDetailReviewResponseWrapper: Decodable {
    let id: Int?
    let results: [MovieDetailReview]?
    
    internal enum CodingKeys: String, CodingKey {
        case id = "id"
        case results = "results"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.results = try values.decodeIfPresent([MovieDetailReview].self, forKey: .results)
    }
}

public struct MovieDetailReview: Decodable {
    let author: String?
    let content: String?
    let createdAt: String?
    
    internal enum CodingKeys: String, CodingKey {
        case author = "author"
        case content = "content"
        case createdAt = "created_at"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.author = try values.decodeIfPresent(String.self, forKey: .author)
        self.content = try values.decodeIfPresent(String.self, forKey: .content)
        self.createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
    }
}
