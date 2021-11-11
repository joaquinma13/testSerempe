//
//  HomeView.swift
//  test
//
//  Created by Macbook on 11/21/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIViewController {
    
    
    @IBOutlet weak var nameMovie: UITextField!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    var stringTitle = [String]()
    var getListRated = [movieModel.Results]()
    var getListRecomendaciones = [movieModel.Results]()
    var getListFavoritas = [movieModel.Results]()
    
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        stringTitle.append("Favorite")
        stringTitle.append("Recommendations")
        stringTitle.append("Rated")
        presenter?.viewDidLoad()
    }
    
    
    @IBAction func searchMovie(_ sender: Any) {
        let aux = searchMovie(name : nameMovie.text ?? "")
        if(!aux.title.elementsEqual("-")){
            presenter?.getDataNextViewDetalle(object: aux)
            nameMovie.text = ""
        }else{
            let alert = UIAlertController(title: "Busqueda", message: "No se encontro ninguna coincidencia", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func searchMovie(name : String) -> movieModel.Results {
        let aux = movieModel.Results (popularity : 0.0,
                                      vote_count : 0.0,
                                      poster_path : "",
                                      original_language : "",
                                      original_title : "",
                                      title : "-",
                                      vote_average : 0.0,
                                      overview : "",
                                      release_date : "")
        for movie in getListRated{
            if (movie.title.uppercased().elementsEqual(name.uppercased())){
                return movie
            }
        }
        for movie in getListRecomendaciones{
            if (movie.title.elementsEqual(name)){
                return movie
            }
        }
        for movie in getListFavoritas{
            if (movie.title.elementsEqual(name)){
                return movie
            }
        }
        return aux
            
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
    func callBackData(Rated: [movieModel.Results], Recomendaciones: [movieModel.Results], Favoritas: [movieModel.Results]) {
        getListRated.removeAll()
        getListRecomendaciones.removeAll()
        getListFavoritas.removeAll()
        getListRated = Rated
        getListRecomendaciones = Recomendaciones
        getListFavoritas = Favoritas
        
    }
    
    func iniciar() {
        DispatchQueue.main.async {
            self.loadIndicator.startAnimating()
        }
    }
    
    func detener() {
        DispatchQueue.main.async {
            self.loadIndicator.stopAnimating()
            self.loadIndicator.hidesWhenStopped = true
        }
    }
    
    
}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "celda")
        cell.textLabel?.text = stringTitle[indexPath.row]
        return cell
    }
}

extension HomeView: UITableViewDelegate {
    // TODO: implement view output methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0){
            presenter?.getDataNextView(objectList: getListFavoritas)
        }else if(indexPath.row == 1){
            presenter?.getDataNextView(objectList: getListRecomendaciones)
        }else if(indexPath.row == 2){
            presenter?.getDataNextView(objectList: getListRated)
        }
    }
}
