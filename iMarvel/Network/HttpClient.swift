//
//  HttpClient.swift
//  iMarvel
//
//  Created by Filipe Amaral Neis on 19/08/19.
//  Copyright © 2019 Filipe Amaral Neis. All rights reserved.
//

import Foundation
import Alamofire

class HttpClient {
    
    func get(url: URLConvertible, parameters: Parameters?) -> DataRequest {
        return request(url: url, method: .get, parameters: parameters, encoding: URLEncoding.default)
    }
    private func request(url: URLConvertible, method: HTTPMethod, parameters: Parameters?,
                 encoding: ParameterEncoding = JSONEncoding.default) -> DataRequest {
        return Alamofire.request(url, method: method, parameters: parameters,
                                 encoding: encoding, headers: self.headers())
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
    }
    
    private func headers() -> HTTPHeaders {
        return  ["Accept": "application/json"]
    }
}
