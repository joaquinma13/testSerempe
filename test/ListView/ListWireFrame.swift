//
//  ListWireFrame.swift
//  test
//
//  Created by Macbook on 11/22/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import UIKit

class ListWireFrame: ListWireFrameProtocol {
    
    

    class func createListModule(category: [movieModel.Results]) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ListView")
        if let view = viewController as? ListView {
            let presenter: ListPresenterProtocol & ListInteractorOutputProtocol = ListPresenter()
            let interactor: ListInteractorInputProtocol & ListRemoteDataManagerOutputProtocol = ListInteractor()
            let localDataManager: ListLocalDataManagerInputProtocol = ListLocalDataManager()
            let remoteDataManager: ListRemoteDataManagerInputProtocol = ListRemoteDataManager()
            let wireFrame: ListWireFrameProtocol = ListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.objectsMovie = category
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ListView", bundle: Bundle.main)
    }
    
    func presentNextView(from view: ListViewProtocol, object: movieModel.Results) {
        let newViewDetalle = DetalleWireFrame.createDetalleModule(data: object)
        if let sourceView = view as? UIViewController{
            sourceView.navigationController?.pushViewController(newViewDetalle, animated: true)
        }
    }
    
}
