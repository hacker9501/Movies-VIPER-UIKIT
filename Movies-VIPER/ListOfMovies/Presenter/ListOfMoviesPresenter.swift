//
//  ListOfMoviesPresenter.swift
//  Movies-VIPER
//
//  Created by Elver Mayta Hernández on 17/03/24.
//

import Foundation

protocol ListOfMoviesPresentableProtocol: AnyObject{
    var ui: ListOfMoviesUI? {get}
    //var custom: [CustomModel] {get}
    var models : [PopularMovieEntity] {get}
    func onViewAppear()
    func onTapCell(atIndex: Int)
}


//patron delegate
protocol ListOfMoviesUI: AnyObject{
    func update(movies: [PopularMovieEntity])
}

class ListOfMoviesPresenter: ListOfMoviesPresentableProtocol {
    
    //esta delegando la view sea el delegado del presenter
    //se utiliza weak porque hay una referencia fuerte de presenter a view y de la view al presenter recyan ciclo
    weak var ui: ListOfMoviesUI?
    var models : [PopularMovieEntity] = []
    var custom: [CustomModel] = []
    private let mapper: Mapper
    private let router: ListOfMoviesRouterViewProtocolo
    private let listOfMoviesInteractor: ListOfMoviesInteractorProtocol
    
    init(listOfMoviesInteractor: ListOfMoviesInteractorProtocol, mapper: Mapper = Mapper(),router: ListOfMoviesRouterViewProtocolo) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewAppear(){
        Task{
            models = await listOfMoviesInteractor.getLisOfMovies().results
            
//            customModel = models.map { model in
//                CustomModel(
//                    title: model.imageURL,
//                    overview: model.title,
//                    imageURL: model.overview)
//            }
            //custom = models.map(mapper.map(entity:))
            ui?.update(movies: models)
        }
    }
    
    func onTapCell(atIndex: Int) {
        let movieId = models[atIndex].id
        router.showDetailMovies(withMovieId: movieId.description)
        print(movieId)
    }
}
