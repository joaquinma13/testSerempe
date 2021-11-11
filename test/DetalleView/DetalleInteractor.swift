//
//  DetalleInteractor.swift
//  test
//
//  Created by Macbook on 11/22/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

class DetalleInteractor: DetalleInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: DetalleInteractorOutputProtocol?
    var localDatamanager: DetalleLocalDataManagerInputProtocol?
    var remoteDatamanager: DetalleRemoteDataManagerInputProtocol?

}

extension DetalleInteractor: DetalleRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
