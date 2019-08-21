//
//  ActivityIndicatorHelper.swift
//  iMarvel
//
//  Created by Filipe Amaral Neis on 20/08/19.
//  Copyright © 2019 Filipe Amaral Neis. All rights reserved.
//

import UIKit

class ActivityIndicatorHelper {
    
    private let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    private let view: UIView
    
    init(with view: UIView) {
        self.view = view
    }
    
    func start() {
        activityIndicator.color = .gray
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.startAnimating()
    }
    
    func stop() {
        activityIndicator.removeFromSuperview()
    }
}
