//
//  UIColor+Extensions.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import Foundation
import UIKit

extension CAGradientLayer {
    static func randomGradient() -> [CGColor] {
        let gradientOptions = [
            [#colorLiteral(red: 1, green: 0, blue: 0.5176470588, alpha: 1).cgColor, #colorLiteral(red: 0.2, green: 0, blue: 0.1058823529, alpha: 1).cgColor],
            [#colorLiteral(red: 0.5137254902, green: 0.2274509804, blue: 0.7058823529, alpha: 1).cgColor, #colorLiteral(red: 0.9882352941, green: 0.6901960784, blue: 0.2705882353, alpha: 1).cgColor],
            [#colorLiteral(red: 0.7803921569, green: 0.4745098039, blue: 0.8156862745, alpha: 1).cgColor, #colorLiteral(red: 0.2941176471, green: 0.7529411765, blue: 0.7843137255, alpha: 1).cgColor],
            [#colorLiteral(red: 0.3921568627, green: 0.2549019608, blue: 0.6470588235, alpha: 1).cgColor, #colorLiteral(red: 0.1647058824, green: 0.03137254902, blue: 0.2705882353, alpha: 1).cgColor],
            [#colorLiteral(red: 0.262745098, green: 0.8078431373, blue: 0.6352941176, alpha: 1).cgColor, #colorLiteral(red: 0.09411764706, green: 0.3529411765, blue: 0.6156862745, alpha: 1).cgColor],
            [#colorLiteral(red: 1, green: 0.631372549, blue: 0.4980392157, alpha: 1).cgColor, #colorLiteral(red: 0, green: 0.1333333333, blue: 0.2431372549, alpha: 1).cgColor],
            [#colorLiteral(red: 0.1176470588, green: 0.07450980392, blue: 0.04705882353, alpha: 1).cgColor, #colorLiteral(red: 0.6039215686, green: 0.5176470588, blue: 0.4705882353, alpha: 1).cgColor],
            [#colorLiteral(red: 0.9921568627, green: 0.9882352941, blue: 0.2784313725, alpha: 1).cgColor, #colorLiteral(red: 0.1411764706, green: 0.9960784314, blue: 0.2549019608, alpha: 1).cgColor],
            [#colorLiteral(red: 0.5137254902, green: 0.6431372549, blue: 0.831372549, alpha: 1).cgColor, #colorLiteral(red: 0.7137254902, green: 0.9843137255, blue: 1, alpha: 1).cgColor],
            [#colorLiteral(red: 0.2823529412, green: 0.3333333333, blue: 0.3882352941, alpha: 1).cgColor, #colorLiteral(red: 0.1607843137, green: 0.1960784314, blue: 0.2352941176, alpha: 1).cgColor],
            [#colorLiteral(red: 0.9960784314, green: 0.5490196078, blue: 0, alpha: 1).cgColor, #colorLiteral(red: 0.9725490196, green: 0.2117647059, blue: 0, alpha: 1).cgColor],
            [#colorLiteral(red: 0, green: 0.7764705882, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0, green: 0.4470588235, blue: 1, alpha: 1).cgColor],
            [#colorLiteral(red: 0.3333333333, green: 0.3843137255, blue: 0.4392156863, alpha: 1).cgColor, #colorLiteral(red: 1, green: 0.4196078431, blue: 0.4196078431, alpha: 1).cgColor],
            [#colorLiteral(red: 0.4705882353, green: 0.007843137255, blue: 0.02352941176, alpha: 1).cgColor, #colorLiteral(red: 0.02352941176, green: 0.06666666667, blue: 0.3803921569, alpha: 1).cgColor]
        ]
        
        return gradientOptions.randomElement() ?? []
    }
    
    static func randomGradientUIColor() -> [UIColor] {
        let gradientOptions = [
            [#colorLiteral(red: 1, green: 0, blue: 0.5176470588, alpha: 1), #colorLiteral(red: 0.2, green: 0, blue: 0.1058823529, alpha: 1)],
            [#colorLiteral(red: 0.5137254902, green: 0.2274509804, blue: 0.7058823529, alpha: 1), #colorLiteral(red: 0.9882352941, green: 0.6901960784, blue: 0.2705882353, alpha: 1)],
            [#colorLiteral(red: 0.7803921569, green: 0.4745098039, blue: 0.8156862745, alpha: 1), #colorLiteral(red: 0.2941176471, green: 0.7529411765, blue: 0.7843137255, alpha: 1)],
            [#colorLiteral(red: 0.3921568627, green: 0.2549019608, blue: 0.6470588235, alpha: 1), #colorLiteral(red: 0.1647058824, green: 0.03137254902, blue: 0.2705882353, alpha: 1)],
            [#colorLiteral(red: 0.262745098, green: 0.8078431373, blue: 0.6352941176, alpha: 1), #colorLiteral(red: 0.09411764706, green: 0.3529411765, blue: 0.6156862745, alpha: 1)],
            [#colorLiteral(red: 1, green: 0.631372549, blue: 0.4980392157, alpha: 1), #colorLiteral(red: 0, green: 0.1333333333, blue: 0.2431372549, alpha: 1)],
            [#colorLiteral(red: 0.1176470588, green: 0.07450980392, blue: 0.04705882353, alpha: 1), #colorLiteral(red: 0.6039215686, green: 0.5176470588, blue: 0.4705882353, alpha: 1)],
            [#colorLiteral(red: 0.9921568627, green: 0.9882352941, blue: 0.2784313725, alpha: 1), #colorLiteral(red: 0.1411764706, green: 0.9960784314, blue: 0.2549019608, alpha: 1)],
            [#colorLiteral(red: 0.5137254902, green: 0.6431372549, blue: 0.831372549, alpha: 1), #colorLiteral(red: 0.7137254902, green: 0.9843137255, blue: 1, alpha: 1)],
            [#colorLiteral(red: 0.2823529412, green: 0.3333333333, blue: 0.3882352941, alpha: 1), #colorLiteral(red: 0.1607843137, green: 0.1960784314, blue: 0.2352941176, alpha: 1)],
            [#colorLiteral(red: 0.9960784314, green: 0.5490196078, blue: 0, alpha: 1), #colorLiteral(red: 0.9725490196, green: 0.2117647059, blue: 0, alpha: 1)],
            [#colorLiteral(red: 0, green: 0.7764705882, blue: 1, alpha: 1), #colorLiteral(red: 0, green: 0.4470588235, blue: 1, alpha: 1)],
            [#colorLiteral(red: 0.3333333333, green: 0.3843137255, blue: 0.4392156863, alpha: 1), #colorLiteral(red: 1, green: 0.4196078431, blue: 0.4196078431, alpha: 1)],
            [#colorLiteral(red: 0.4705882353, green: 0.007843137255, blue: 0.02352941176, alpha: 1), #colorLiteral(red: 0.02352941176, green: 0.06666666667, blue: 0.3803921569, alpha: 1)]
        ]
        
        return gradientOptions.randomElement() ?? []
    }
}

public class GradientView: UIView {
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}

    override public class var layerClass: AnyClass { CAGradientLayer.self }

    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updatePoints()
        updateLocations()
        updateColors()
    }

}
