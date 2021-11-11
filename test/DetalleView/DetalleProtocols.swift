//
//  DetalleProtocols.swift
//  test
//
//  Created by Macbook on 11/22/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import UIKit

protocol DetalleViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: DetallePresenterProtocol? { get set }
    func showDetalle(data:movieModel.Results)
    
}

protocol DetalleWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createDetalleModule(data : movieModel.Results) -> UIViewController
}

protocol DetallePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: DetalleViewProtocol? { get set }
    var interactor: DetalleInteractorInputProtocol? { get set }
    var wireFrame: DetalleWireFrameProtocol? { get set }
    var datoBeforeView : movieModel.Results? {get set}
    
    func viewDidLoad()
}

protocol DetalleInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol DetalleInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: DetalleInteractorOutputProtocol? { get set }
    var localDatamanager: DetalleLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetalleRemoteDataManagerInputProtocol? { get set }
}

protocol DetalleDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol DetalleRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetalleRemoteDataManagerOutputProtocol? { get set }
}

protocol DetalleRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol DetalleLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
