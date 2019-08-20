//
//  Api.swift
//  iMarvel
//
//  Created by Filipe Amaral Neis on 19/08/19.
//  Copyright © 2019 Filipe Amaral Neis. All rights reserved.
//

import Foundation
import Alamofire

class Api {
    
    private let httpClient = HttpClient()
    
    func get(url: URLConvertible, parameters: Parameters?, success: @escaping (Int, Any, Any) -> Void,
             failure: @escaping (Int, Any) -> Void) {
        httpClient.get(url: url, parameters: parameters).responseJSON { response in
            self.handleResponse(response: response, success: success, failure: failure)
        }
    }
    
    private func handleResponse(response: DataResponse<Any>, success: (Int, [String: AnyObject], Any) -> Void,
                        failure: (Int, Any) -> Void ) {
        let statusCode: Int! = response.response?.statusCode
        
        switch response.result {
        case .success :
            if response.result.value != nil {
                let headers = response.response?.allHeaderFields
                success(statusCode, headers as! [String: AnyObject], response.data ?? "")
            } else {
                failure(statusCode, response)
            }
        case .failure :
            if let statusCode = response.response?.statusCode {
                failure(statusCode, response)
            } else {
                failure(400, response)
            }
        }
    }
}
