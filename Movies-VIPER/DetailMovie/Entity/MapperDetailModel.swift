//
//  MapperDetailModel.swift
//  Movies-VIPER
//
//  Created by Elver Mayta Hernández on 17/03/24.
//

import Foundation

struct MapperDetailModel{
    func map(entity: DetailEntity) -> CustomDetailViewModel {
        .init(title: entity.title, overview: entity.overview, backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath))
    }
}
