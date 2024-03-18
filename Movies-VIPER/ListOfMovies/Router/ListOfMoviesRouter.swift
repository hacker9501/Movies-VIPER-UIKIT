//
//  ListOfMoviesRouter.swift
//  Movies-VIPER
//
//  Created by Elver Mayta Hernández on 17/03/24.
//

import Foundation
import UIKit

protocol ListOfMoviesRouterViewProtocolo{
    var detailRouter: DetailRouterProtocolo? { get }
    var lisOfMovieView: LisOfMoviesView? { get }
    func showListOfMovies(window: UIWindow?)
    func showDetailMovies(withMovieId movieId: String)
}

class ListOfMoviesRouter: ListOfMoviesRouterViewProtocolo{
    
    var detailRouter: DetailRouterProtocolo?
    var lisOfMovieView: LisOfMoviesView?
    
    func showListOfMovies(window: UIWindow?){
        self.detailRouter = DetailRouter()
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor, router: self)
        lisOfMovieView = LisOfMoviesView(presenter: presenter)
        presenter.ui = lisOfMovieView
        //view.presenter = presenter
        
        window?.rootViewController = lisOfMovieView
        window?.makeKeyAndVisible()
    }
    
    func showDetailMovies(withMovieId movieId: String){
        
        //como lisOfMovieView es opcional se lo hacemos guard let
        guard let fronViewController = lisOfMovieView else{
            return
        }
        
        detailRouter?.showDetail(fromViewcontroller: fronViewController, withMovieId: movieId)
    }
}
