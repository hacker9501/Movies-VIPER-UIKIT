//
//  ListOfMoviesInteractor.swift
//  Movies-VIPER
//
//  Created by Elver Mayta Hernández on 17/03/24.
//

import Foundation
//2801eb354fe61c598d761c4d763effc1
protocol ListOfMoviesInteractorProtocol: AnyObject{
    func getLisOfMovies() async -> PopularMovieResponseEntity
}

class ListOfMoviesInteractor: ListOfMoviesInteractorProtocol{
    func getLisOfMovies() async -> PopularMovieResponseEntity{
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=2801eb354fe61c598d761c4d763effc1")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}

class ListOfMoviesInteractorMock: ListOfMoviesInteractorProtocol{
    func getLisOfMovies() async -> PopularMovieResponseEntity {
        return PopularMovieResponseEntity(results: [
            .init(id: 1, title: "Elver", overview: "Como estas", imageURL: "", votes: 12.5),
            .init(id: 2, title: "Jymi Beta", overview: "Como estas", imageURL: "", votes: 8.5),
            .init(id: 3, title: "Senior de los senior", overview: "Como estas", imageURL: "", votes: 12.5),
            .init(id: 4, title: "Friends", overview: "Como estas", imageURL: "", votes: 5.5),
            .init(id: 5, title: "Jymy", overview: "Senior ios", imageURL: "", votes: 10.5),
        ])
    }
    
}
