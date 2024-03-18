//
//  DetailRouter.swift
//  Movies-VIPER
//
//  Created by Elver Mayta Hernández on 17/03/24.
//

import Foundation
import UIKit

protocol DetailRouterProtocolo{
    func showDetail(fromViewcontroller: UIViewController,withMovieId movieId: String)
}

class DetailRouter: DetailRouterProtocolo{
    func showDetail(fromViewcontroller: UIViewController, withMovieId movieId: String) {
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(movieId: movieId, interactor: interactor, mapper: MapperDetailModel())
        let view = DetailView(presenter: presenter)
        presenter.ui = view
        
        fromViewcontroller.present(view, animated: true)
    }
    
}
