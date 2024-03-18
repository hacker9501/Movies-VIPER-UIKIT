//
//  DetailPresenter.swift
//  Movies-VIPER
//
//  Created by Elver Mayta Hernández on 17/03/24.
//

import Foundation

protocol DetailPresenterUIProtocol: AnyObject{
    func updateUI(detail: CustomDetailViewModel)
}

protocol DetailPresentable: AnyObject{
    var ui: DetailPresenterUIProtocol? {get}
    var movieId: String {get}
    func onViewAppear()
    
}

class DetailPresenter: DetailPresentable {
    weak var ui: DetailPresenterUIProtocol?
    
    let movieId: String
    private let interactor: DetailInteractor
    private let mapper: MapperDetailModel
    
    init(movieId: String, interactor: DetailInteractor,mapper: MapperDetailModel) {
        self.movieId = movieId
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear(){
        Task{
            let model = await interactor.getDetailMovie(withId: movieId)
            let detail = mapper.map(entity: model)
            await MainActor.run{
                self.ui?.updateUI(detail:detail)
                print(detail)
            }
            
        }
    }
}
