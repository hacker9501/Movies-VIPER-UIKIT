//
//  LisOfMoviesView.swift
//  Movies-VIPER
//
//  Created by Elver Mayta Hernández on 17/03/24.
//

import Foundation
import UIKit

class LisOfMoviesView: UIViewController{
    
    private var moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MovieCellView.self, forCellReuseIdentifier: "MovieCellView")
        return tableView
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    //var presenter:ListOfMoviesPresenter?
    private let presenter:ListOfMoviesPresentableProtocol
    
    init(presenter:ListOfMoviesPresentableProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.onViewAppear()
        setupTableView()
    }
    
    private func setupTableView(){
        view.addSubview(moviesTableView)
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            // Establece que el borde izquierdo de la searchBar sea igual al borde izquierdo de la vista principal
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            // Establece que el borde derecho de la searchBar sea igual al borde derecho de la vista principal
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Establece que el borde superior de la searchBar sea igual al borde superior de la vista principal, respetando la guía de diseño segura
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            // Establece la altura de la searchBar en 50 puntos
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            // Establece que el borde inferior de la searchBar sea menor o igual al borde superior de la moviesTableView, con un espacio de -8 puntos (8 puntos por debajo)
            // Esto agrega un espacio entre la searchBar y la moviesTableView
            searchBar.bottomAnchor.constraint(lessThanOrEqualTo: moviesTableView.topAnchor, constant: -8),
            
            // Establece que el borde izquierdo de la moviesTableView sea igual al borde izquierdo de la vista principal
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            // Establece que el borde derecho de la moviesTableView sea igual al borde derecho de la vista principal
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Establece que el borde superior de la moviesTableView sea igual al borde inferior de la searchBar, con un espacio de 8 puntos (8 puntos por encima)
            // Esto agrega un espacio entre la searchBar y la moviesTableView
            moviesTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            
            // Establece que el borde inferior de la moviesTableView sea igual al borde inferior de la vista principal
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        searchBar.delegate = self
    }
}

extension LisOfMoviesView: ListOfMoviesUI{
    func update(movies: [PopularMovieEntity]) {
        print("Datos recibidos \(movies)")
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
    
}

extension LisOfMoviesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
}

extension LisOfMoviesView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as! MovieCellView
        //cell.backgroundColor = .red
        cell.selectionStyle = .none
        let model = presenter.models[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
}

extension LisOfMoviesView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Aquí puedes agregar la lógica para filtrar los resultados de búsqueda
        
    }
}
