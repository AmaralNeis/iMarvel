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
}

extension EndPoints {
    var url : String {
        
        switch self {
        case .getMovies(let page):
            return String(format: "%@/now_playing?api_key=%@&language=%@&page=%i",
                          Constants.baseUrl, Constants.apiKey, Constants.language, page)
            
        case .getDetailMovie(let idMovie):
            return String(format: "%@/%i?api_key=%@&language=%@",
                          Constants.baseUrl, idMovie, Constants.apiKey, Constants.language)
        }
    }
}
