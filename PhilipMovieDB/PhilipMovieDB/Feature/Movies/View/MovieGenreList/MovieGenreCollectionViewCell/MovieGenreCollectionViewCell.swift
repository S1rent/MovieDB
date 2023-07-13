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
    @IBOutlet weak var buttonCell: UIButton!
    
    var cellTappedCallback: ((_ data: MovieGenre) -> Void)?
    var data: MovieGenre?
    
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
        self.buttonCell.setTitle("", for: .normal)
    }
    
    public func setData(_ data: MovieGenre, callback: @escaping ((_ data: MovieGenre) -> Void)) {
        self.labelGenreName.text = data.name ?? "-"
        self.cellTappedCallback = callback
        self.data = data
    }

    @IBAction func cellTapped(_ sender: Any) {
        guard let callBack = self.cellTappedCallback,
              let data = self.data
            else { return }
        
        callBack(data)
    }
}
