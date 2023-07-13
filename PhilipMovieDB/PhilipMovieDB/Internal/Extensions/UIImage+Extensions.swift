//
//  UIImage+Extensions.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation
import UIKit
import SwiftGifOrigin

public class GIFImage {
    internal enum GIFImageEnum: String {
        case spidermanGreetings = "spiderman-greetings"
    }
    
    static func getGifPath(_ key: GIFImageEnum) -> String {
        return key.rawValue
    }
}

extension UIImage {
    public class func gif(name: String) -> UIImage? {
        guard let bundleURL = Bundle.main
            .url(forResource: name, withExtension: "gif") else {
                print("SwiftGif: This image named \"\(name)\" does not exist")
                return nil
        }
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
            return nil
        }
        
        return gif(data: imageData)
    }
}
