//
//  MovieTarget.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation
import Moya

internal enum MovieTarget {
    case getMovieGenre
    case getMoviesByGenre(page: Int, genreId: Int)
}

extension MovieTarget: TargetType {
    internal var baseURL: URL {
        switch self {
        case .getMovieGenre:
            return URL(string: URL.baseURL())!
        case .getMoviesByGenre:
            return URL(string: URL.baseURL())!
        }
    }
    
    internal var path: String {
        switch self {
        case .getMovieGenre:
            return "genre/movie/list"
        case .getMoviesByGenre:
            return "discover/movie"
        }
    }
    
    internal var method: Moya.Method {
        switch self {
        case .getMovieGenre, .getMoviesByGenre:
            return .get
        }
    }
    
    internal var parameters: [String: Any]? {
        switch self {
        case .getMovieGenre:
            return [
                "api_key": URL.apiKey(),
                "language": "en"
            ]
        case let .getMoviesByGenre(page, genreId):
            return [
                "api_key": URL.apiKey(),
                "page": "\(page)",
                "with_genres": "\(genreId)",
                "include_adult": true
            ]
        }
    }
    
    internal var parameterEncoding: ParameterEncoding {
        switch self {
        default:
            return URLEncoding.queryString
        }
    }
    
    internal var sampleData: Data {
        return "{ \"data\": 0 }".data(using: .utf8)!
    }
    
    internal var headers: [String : String]? {
        switch self {
        default:
            return [
                "Content-Type": "application/json"
            ]
        }
        
    }
    
    internal var task: Task {
        return .requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
    }
}
