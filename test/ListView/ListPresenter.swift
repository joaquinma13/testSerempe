//
//  ListPresenter.swift
//  test
//
//  Created by Macbook on 11/22/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

class ListPresenter  {
    
    // MARK: Properties
    weak var view: ListViewProtocol?
    var interactor: ListInteractorInputProtocol?
    var wireFrame: ListWireFrameProtocol?
    var objectsMovie: [movieModel.Results]?
}

extension ListPresenter: ListPresenterProtocol {
    func getDataNextView(data : movieModel.Results ) {
        print("holaaa")
        wireFrame?.presentNextView(from: view!, object: data)
    }
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        //print("Datos Pasados \(objectsMovie)")
        view?.showMovies(category: objectsMovie!)
        
    }
}

extension ListPresenter: ListInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
