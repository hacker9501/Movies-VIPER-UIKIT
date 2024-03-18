//
//  MovieCellView.swift
//  Movies-VIPER
//
//  Created by Elver Mayta Hernández on 17/03/24.
//

import Foundation
import UIKit
import Kingfisher

class MovieCellView: UITableViewCell{

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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(movieImageView)
        addSubview(movieName)
        addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            // Establece la posición del lado izquierdo de movieImageView para que coincida con el lado izquierdo del contenedor principal (leadingAnchor), con un desplazamiento de 12 puntos.
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            // Establece la posición del lado superior de movieImageView para que coincida con el lado superior del contenedor principal (topAnchor), con un desplazamiento de 12 puntos.
            movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            
            // Establece la altura de movieImageView en 200 puntos.
            movieImageView.heightAnchor.constraint(equalToConstant: 200),
            
            // Establece el ancho de movieImageView en 100 puntos.
            movieImageView.widthAnchor.constraint(equalToConstant: 100),
            
            // Establece la posición del lado inferior de movieImageView para que sea menor o igual al lado inferior del contenedor principal (bottomAnchor), con un desplazamiento de -12 puntos. La restricción `lessThanOrEqualTo` asegura que movieImageView no se desplace más allá del límite inferior del contenedor principal.
            movieImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12),
            
            // Establece la posición del lado izquierdo de movieName para que coincida con el lado derecho de movieImageView, con un desplazamiento de 18 puntos.
            movieName.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 18),
            
            // Establece la posición del lado derecho de movieName para que coincida con el lado derecho del contenedor principal, con un desplazamiento de -12 puntos.
            movieName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            // Establece la posición del lado superior de movieName para que coincida con el lado superior de movieImageView, con un desplazamiento de 24 puntos.
            movieName.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 24),
            
            // Establece la posición del lado izquierdo de movieDescription para que coincida con el lado derecho de movieImageView, con un desplazamiento de 20 puntos.
            movieDescription.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20),
            
            // Establece la posición del lado derecho de movieDescription para que coincida con el lado derecho del contenedor principal, con un desplazamiento de -12 puntos.
            movieDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            // Establece la posición del lado superior de movieDescription para que coincida con el lado inferior de movieName, con un desplazamiento de 8 puntos.
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 8),
            
            // Establece la posición del lado inferior de movieDescription para que sea menor o igual al lado inferior del contenedor principal (bottomAnchor), con un desplazamiento de -12 puntos. La restricción `lessThanOrEqualTo` asegura que movieDescription no se desplace más allá del límite inferior del contenedor principal.
            movieDescription.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12)
        ])

    }
    
    func configure(model: PopularMovieEntity){
        movieName.text = model.title
        movieDescription.text = model.overview
        movieImageView.kf.setImage(with: URL(string:"https://image.tmdb.org/t/p/w200" + model.imageURL))
        //movieImageView.kf.setImage(with: model.imageURL)
    }
}
