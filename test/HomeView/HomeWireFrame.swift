//
//  HomeWireFrame.swift
//  viper
//
//  Created by Macbook on 9/5/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {

    class func createHomeModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "NavigationHomeView")
        if let view = navController.children.first as? HomeView {
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
            let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
            let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
            let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeView", bundle: Bundle.main)
    }
    
    func presentNextView(from view: HomeViewProtocol, objectList: [movieModel.Results]) {
        //func presentNextView(from view : HomeViewProtocol, objectList: [movieModel.Results])
        let newViewDetalle = ListWireFrame.createListModule(category: objectList)
        if let sourceView = view as? UIViewController{
            sourceView.navigationController?.pushViewController(newViewDetalle, animated: true)
        }
    }
    
    func presentNextViewDetalle(from view: HomeViewProtocol, object: movieModel.Results) {
        let newViewDetalle = DetalleWireFrame.createDetalleModule(data: object)
        if let sourceView = view as? UIViewController{
            sourceView.navigationController?.pushViewController(newViewDetalle, animated: true)
        }
    }
    
}
