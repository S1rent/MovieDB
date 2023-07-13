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
}

extension MovieTarget: TargetType {
    internal var baseURL: URL {
        switch self {
        case .getMovieGenre:
            return URL(string: URL.baseURL())!
        }
    }
    
    internal var path: String {
        switch self {
        case .getMovieGenre:
            return "genre/movie/list"
        }
    }
    
    internal var method: Moya.Method {
        switch self {
        case .getMovieGenre:
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
