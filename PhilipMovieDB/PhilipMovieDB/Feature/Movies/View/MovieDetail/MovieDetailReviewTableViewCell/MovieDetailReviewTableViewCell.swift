//
//  MovieDetailReviewTableViewCell.swift
//  PhilipMovieDB
//
//  Created by IT Division on 15/07/23.
//

import UIKit

class MovieDetailReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelRatingCreateDate: UILabel!
    @IBOutlet weak var labelReview: UILabel!
    @IBOutlet weak var reviewGradientView: GradientView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
        self.reviewGradientView.layer.cornerRadius = 8
        
        let randomGradientColor = CAGradientLayer.randomGradientUIColor()
        self.reviewGradientView.startColor = randomGradientColor[0]
        self.reviewGradientView.endColor = randomGradientColor[1]
        self.reviewGradientView.updateColors()
    }
    
    public func setData(_ data: MovieDetailReview) {
        let attributedReview = (data.content ?? "-").htmlToAttributedString
        self.labelReview.attributedText = attributedReview
        self.labelReview.textColor = UIColor.white
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateFormatter.date(from: data.createdAt ?? "0001-01-01")!
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        self.labelRatingCreateDate.text = "Rating:\n\(data.authorDetails?.rating ?? 0) / 10"
        
        self.labelUsername.text = "\(data.author ?? "-") - \(dateFormatter.string(from: date))"
    }
    
}
