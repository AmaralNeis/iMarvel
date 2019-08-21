//
//  EndPoints.swift
//  iMarvel
//
//  Created by Filipe Amaral Neis on 19/08/19.
//  Copyright © 2019 Filipe Amaral Neis. All rights reserved.
//

import Foundation

enum EndPoints {
    case getMovies(Int)
    case getDetailMovie(Int)
    case filter(String)
}

extension EndPoints {
    var url : String {
        
        switch self {
        case .getMovies(let page):
            return String(format: "%@/movie/now_playing?api_key=%@&language=%@&page=%i",
                          Constants.baseUrl, Constants.apiKey, Constants.language, page)
            
        case .getDetailMovie(let idMovie):
            return String(format: "%@/movie/%i?api_key=%@&language=%@",
                          Constants.baseUrl, idMovie, Constants.apiKey, Constants.language)
            
        case .filter(let query):
            return String(format: "%@/search/movie?api_key=%@&language=%@&query=%@",
                          Constants.baseUrl, Constants.apiKey, Constants.language, query)
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
        
    }
}
