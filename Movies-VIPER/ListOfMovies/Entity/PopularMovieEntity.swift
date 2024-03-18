//
//  PopularMovieEntity.swift
//  Movies-VIPER
//
//  Created by Elver Mayta Hernández on 17/03/24.
//

import Foundation

struct PopularMovieEntity: Decodable{
    var id: Int
    var title: String
    var overview: String
    var imageURL: String
    var votes: Double
    
    enum CodingKeys: String, CodingKey{
        case id, title, overview
        case imageURL = "poster_path"
        case votes = "vote_average"
    }
}
