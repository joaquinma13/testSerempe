//
//  HomeRemoteDataManager.swift
//  viper
//
//  Created by Macbook on 9/5/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    var getListRated = [movieModel.Results]()
    var getListRecomendaciones = [movieModel.Results]()
    var getListFavoritas = [movieModel.Results]()
    
    func externalGetData() {
        let URL1 = "https://api.themoviedb.org/3/list/15570?api_key=c07d7dea322ca5374adcb3f802a55a5b&language=en-US"
            Alamofire.request(URL1, headers: nil).responseObject { (response: DataResponse<movieModel.servicio>) in
                let serviceResponse = response.result.value
                if let result_objects = serviceResponse?.results {
                    self.getListRated.removeAll()
                    for objects in result_objects {
                        self.getListRated.append(objects)
                    }
                    let URL2 = "https://api.themoviedb.org/3/movie/popular?api_key=c07d7dea322ca5374adcb3f802a55a5b"
                        Alamofire.request(URL2, headers: nil).responseObject { (response: DataResponse<movieModel.servicio>) in
                            let serviceResponse = response.result.value
                            if let result_objects = serviceResponse?.results {
                                self.getListRecomendaciones.removeAll()
                                for objects in result_objects {
                                    self.getListRecomendaciones.append(objects)
                                }
                                let URL3 = "https://api.themoviedb.org/3/movie/top_rated?api_key=c07d7dea322ca5374adcb3f802a55a5b"
                                    Alamofire.request(URL3, headers: nil).responseObject { (response: DataResponse<movieModel.servicio>) in
                                        let serviceResponse = response.result.value
                                        if let result_objects = serviceResponse?.results {
                                            self.getListFavoritas.removeAll()
                                            for objects in result_objects {
                                                self.getListFavoritas.append(objects)
                                            }
                                            self.remoteRequestHandler?.callBackData(Rated: self.getListRated, Recomendaciones: self.getListRecomendaciones, Favoritas: self.getListFavoritas )
                                        }
                                }
                            }
                    }
                }
        }
    }
    
}
