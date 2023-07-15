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
    case getMovieDetail(movieId: Int)
    case getMovieDetailVideo(movieId: Int)
    case getMovieDetailReview(page: Int, movieId: Int)
}

extension MovieTarget: TargetType {
    internal var baseURL: URL {
        switch self {
        default:
            return URL(string: URL.baseURL())!
        }
    }
    
    internal var path: String {
        switch self {
        case .getMovieGenre:
            return "genre/movie/list"
        case .getMoviesByGenre:
            return "discover/movie"
        case let .getMovieDetail(movieId):
            return "movie/\(movieId)"
        case let .getMovieDetailVideo(movieId):
            return "movie/\(movieId)/videos"
        case let .getMovieDetailReview(_, movieId):
            return "movie/\(movieId)/reviews"
        }
    }
    
    internal var method: Moya.Method {
        switch self {
        default:
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
        case .getMovieDetail:
            return [
                "api_key": URL.apiKey()
            ]
        case .getMovieDetailVideo:
            return [
                "api_key": URL.apiKey()
            ]
        case let .getMovieDetailReview(page, _):
            return [
                "api_key": URL.apiKey(),
                "page": "\(page)"
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
