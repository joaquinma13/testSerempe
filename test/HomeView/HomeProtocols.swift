//
//  HomeProtocols.swift
//  viper
//
//  Created by Macbook on 9/5/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol: class {
    // PRESENTER -> VIEW
    
    var presenter: HomePresenterProtocol? { get set }
    func callBackData(Rated: [movieModel.Results], Recomendaciones: [movieModel.Results], Favoritas: [movieModel.Results])
    func iniciar()
    func detener()
}

protocol HomeWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
    func presentNextView(from view : HomeViewProtocol, objectList: [movieModel.Results])
    func presentNextViewDetalle(from view : HomeViewProtocol, object: movieModel.Results)
    
}

protocol HomePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func getDataNextView(objectList: [movieModel.Results])
    func getDataNextViewDetalle(object: movieModel.Results)
    
}

protocol HomeInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func callBackData(Rated: [movieModel.Results], Recomendaciones: [movieModel.Results], Favoritas: [movieModel.Results] )
}

protocol HomeInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    //
    func getExternalData()
    
}

protocol HomeDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
    func externalGetData()
    
}

protocol HomeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func callBackData(Rated: [movieModel.Results], Recomendaciones: [movieModel.Results], Favoritas: [movieModel.Results] )
}

protocol HomeLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
