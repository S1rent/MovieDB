//
//  HomeViewController.swift
//  PhilipMovieDB
//
//  Created by IT Division on 13/07/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imageGreetings: UIImageView!
    @IBOutlet weak var buttonNavigate: UIButton!
    @IBOutlet weak var labelGreetings: UILabel!
    
    private let presenter: HomePresenter
    
    init(presenter: HomePresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    private func setupView() {
        self.buttonNavigate.layer.cornerRadius = 8
        self.buttonNavigate.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.buttonNavigate.tintColor = UIColor.black
        self.buttonNavigate.titleLabel?.textColor = UIColor.black
        self.buttonNavigate.backgroundColor = UIColor.white
        self.buttonNavigate.setTitle("Lets Go!", for: .normal)
        self.imageGreetings.image = UIImage.gif(name: GIFImage.getGifPath(.spidermanGreetings))
        let hour = Calendar.current.component(.hour, from: Date())

        var string = "Morning"
        switch hour {
        case 6..<12 :
            string = "Morning"
        case 12..<17 :
            string = "Afternoon"
        case 17..<22 :
            string = "Evening"
        default:
            string = "Night"
        }
        self.labelGreetings.text = "Good \(string), Viewers!"
    }
    
    @IBAction func buttonNavigateTapped(_ sender: Any) {
        self.presenter.navigateToMovieGenreList()
    }
}
