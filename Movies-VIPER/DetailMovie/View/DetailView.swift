//
//  DetailView.swift
//  Movies-VIPER
//
//  Created by Elver Mayta Hernández on 17/03/24.
//

import Foundation
import UIKit
import Kingfisher

class DetailView: UIViewController {
    private let presenter: DetailPresenter
    
    let movieImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 32,weight: .bold,width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12,weight: .regular,width: .standard)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(presenter: DetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        presenter.onViewAppear()
    }
    
    func setupView() {
        
        view.addSubview(movieImageView)
        view.addSubview(movieName)
        view.addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 12),
            movieImageView.heightAnchor.constraint(equalToConstant: 200),
            movieImageView.widthAnchor.constraint(equalToConstant: 300),
            
            movieName.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            movieName.topAnchor.constraint(equalTo: movieImageView.bottomAnchor,constant: 20),
            
            movieDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor,constant: 20),
            
        ])
    }
}

extension DetailView: DetailPresenterUIProtocol{
    func updateUI(detail: CustomDetailViewModel) {
        movieName.text = detail.title
        movieDescription.text = detail.overview
        movieImageView.kf.setImage(with: detail.backdropPath)
    }
    
}
