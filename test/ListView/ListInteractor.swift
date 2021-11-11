//
//  ListInteractor.swift
//  test
//
//  Created by Macbook on 11/22/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

class ListInteractor: ListInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ListInteractorOutputProtocol?
    var localDatamanager: ListLocalDataManagerInputProtocol?
    var remoteDatamanager: ListRemoteDataManagerInputProtocol?

}

extension ListInteractor: ListRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
