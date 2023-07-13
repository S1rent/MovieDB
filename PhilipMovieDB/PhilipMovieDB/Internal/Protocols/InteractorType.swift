//
//  InteractorType.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation

public protocol InteractorType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
