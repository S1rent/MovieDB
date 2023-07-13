//
//  URL+Extensions.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation

extension URL {
    static func baseURL() -> String {
        return "https://api.themoviedb.org/3/"
    }
    
    static func apiKey() -> String {
        return "93286dcb4bb910326e5e6607672a8685"
    }
}
