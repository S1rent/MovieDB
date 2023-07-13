//
//  MovieGenreCollectionViewCell.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import UIKit

class MovieGenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelGenreName: UILabel!
    @IBOutlet weak var labelGradientView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupView()
    }
    
    private func setupView() {
        let gradient = CAGradientLayer()

        gradient.frame = labelGradientView.bounds
        gradient.colors = CAGradientLayer.randomGradient()
        gradient.cornerRadius = 8
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)

        labelGradientView.layer.insertSublayer(gradient, at: 0)
        self.labelGradientView.layer.cornerRadius = 8
        self.labelGradientView.layer.masksToBounds = true
    }
    
    public func setData(_ data: MovieGenre) {
        self.labelGenreName.text = data.name ?? "-"
    }

}
