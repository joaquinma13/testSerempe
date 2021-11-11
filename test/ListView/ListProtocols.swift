//
//  ListProtocols.swift
//  test
//
//  Created by Macbook on 11/22/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import UIKit

protocol ListViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ListPresenterProtocol? { get set }
    func showMovies(category: [movieModel.Results])
    
}

protocol ListWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createListModule(category: [movieModel.Results]) -> UIViewController
    func presentNextView(from view : ListViewProtocol, object: movieModel.Results)
}

protocol ListPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ListViewProtocol? { get set }
    var interactor: ListInteractorInputProtocol? { get set }
    var wireFrame: ListWireFrameProtocol? { get set }
    var objectsMovie: [movieModel.Results]? { get set }
    func viewDidLoad()
    func getDataNextView(data : movieModel.Results)
}

protocol ListInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol ListInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ListInteractorOutputProtocol? { get set }
    var localDatamanager: ListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ListRemoteDataManagerInputProtocol? { get set }
}

protocol ListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ListRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ListRemoteDataManagerOutputProtocol? { get set }
}

protocol ListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
