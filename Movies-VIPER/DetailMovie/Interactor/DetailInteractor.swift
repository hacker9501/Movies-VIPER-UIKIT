//
//  DetailInteractor.swift
//  Movies-VIPER
//
//  Created by Elver Mayta Hernández on 17/03/24.
//

import Foundation

protocol DetailInteractorProtocol{
    func getDetailMovie(withId id: String) async -> DetailEntity
}

class DetailInteractor {
    func getDetailMovie(withId id: String) async -> DetailEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=2801eb354fe61c598d761c4d763effc1")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsondecoder = JSONDecoder()
        jsondecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsondecoder.decode(DetailEntity.self, from: data)
    }
}
