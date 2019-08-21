//
//  NetworkHelper.swift
//  iMarvel
//
//  Created by Filipe Amaral Neis on 20/08/19.
//  Copyright © 2019 Filipe Amaral Neis. All rights reserved.
//

import Alamofire

class NetworkHelper {
    static func isConnectedToNetwork() -> Bool {
        return (NetworkReachabilityManager()?.isReachable)!
    }
}
