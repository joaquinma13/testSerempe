//
//  movieModel.swift
//  test
//
//  Created by Macbook on 11/22/20.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation
import ObjectMapper

public class movieModel {
    
    class servicio: Mappable {
        var results:[Results]?
        
        required init?(map: Map){
            
        }
        
        func mapping(map: Map) {
            results <- map["results"]
            results <- map["items"]
        }
    }
    
    class Results: Mappable {
        var popularity: Double = 0.0
        var vote_count: Double = 0.0
        var poster_path: String = ""
        var original_language: String = ""
        var original_title: String = ""
        var title: String = ""
        var vote_average: Double = 0.0
        var overview: String = ""
        var release_date: String = ""
        
        init(popularity : Double,
             vote_count : Double,
             poster_path : String,
             original_language : String,
             original_title : String,
             title : String,
             vote_average : Double,
             overview : String,
             release_date : String) {
            self.popularity = popularity
            self.vote_count = vote_count
            self.poster_path = poster_path
            self.original_language = original_language
            self.original_title = original_title
            self.title = title
            self.vote_average = vote_average
            self.overview = overview
            self.release_date = release_date
        }
        
        required init?(map: Map){
        }
        
        func mapping(map: Map) {
            popularity <- map["popularity"]
            vote_count <- map["vote_count"]
            poster_path <- map["poster_path"]
            original_language <- map["original_language"]
            original_title <- map["original_title"]
            title <- map["title"]
            vote_average <- map["vote_average"]
            overview <- map["overview"]
            release_date <- map["release_date"]
        }
    }
    
}
