//
//  ApiResults.swift
//  iMarvel
//
//  Created by Filipe Amaral Neis on 19/08/19.
//  Copyright © 2019 Filipe Amaral Neis. All rights reserved.
//

import Foundation

struct ApiResults<T: Codable>: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [T]
}






