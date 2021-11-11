//
//  HomePresenter.swift
//  viper
//
//  Created by Macbook on 9/5/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

class HomePresenter  {
    
    var stringCollection = [String]()
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    func getDataNextViewDetalle(object: movieModel.Results) {
        wireFrame?.presentNextViewDetalle(from: view!, object: object)
    }
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        //Se consulta al interactor para extraer los datos remotos
        interactor?.getExternalData()
        view?.iniciar()
    }
    
    /*func getStringNextView(data: [CategoryUrl]) {
        wireFrame?.presentNextView(from: view!, object: data)
    }*/
    
    func getDataNextView(objectList: [movieModel.Results]){
        //func presentNextView(from view : HomeViewProtocol, objectList: [movieModel.Results])
        wireFrame?.presentNextView(from: view!, objectList: objectList)
        /*for movie in objectList {
            print("titulo: \(movie.title)")
        }*/
    }
    //getDataNextViewDetalle
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func callBackData(Rated: [movieModel.Results], Recomendaciones: [movieModel.Results], Favoritas: [movieModel.Results]) {
        view?.callBackData(Rated: Rated, Recomendaciones: Recomendaciones, Favoritas: Favoritas)
        view?.detener()
    }
}
