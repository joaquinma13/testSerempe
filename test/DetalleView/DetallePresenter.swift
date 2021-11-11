//
//  DetallePresenter.swift
//  test
//
//  Created by Macbook on 11/22/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

class DetallePresenter  {
    
    // MARK: Properties
    weak var view: DetalleViewProtocol?
    var interactor: DetalleInteractorInputProtocol?
    var wireFrame: DetalleWireFrameProtocol?
    var datoBeforeView : movieModel.Results?
    
}

extension DetallePresenter: DetallePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.showDetalle(data: datoBeforeView!)
    }
}

extension DetallePresenter: DetalleInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
