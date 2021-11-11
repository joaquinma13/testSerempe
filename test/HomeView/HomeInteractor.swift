//
//  HomeInteractor.swift
//  viper
//
//  Created by Macbook on 9/5/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    func getExternalData() {
        remoteDatamanager?.externalGetData()
    }

}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
    // TODO: Implement use case methods
    func callBackData(Rated: [movieModel.Results], Recomendaciones: [movieModel.Results], Favoritas: [movieModel.Results]){
        presenter?.callBackData(Rated: Rated, Recomendaciones: Recomendaciones, Favoritas: Favoritas)
    }
    
}
