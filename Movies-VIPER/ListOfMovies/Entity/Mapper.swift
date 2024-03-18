//
//  Mapper.swift
//  Movies-VIPER
//
//  Created by Elver Mayta Hernández on 17/03/24.
//

import Foundation

struct Mapper{
    func map(entity: PopularMovieEntity) -> CustomModel{
        .init(
            title: entity.title,
            overview: entity.title,
            imageURL: URL(string:"https://image.tmdb.org/t/p/w200" + entity.imageURL))
    }
}
