//
//  String+.swift
//  iMarvel
//
//  Created by Filipe Amaral Neis on 20/08/19.
//  Copyright © 2019 Filipe Amaral Neis. All rights reserved.
//

import Foundation
// 706d6d -> grey
// fe6e00 -> Orange
extension String {
    var convertDateToPtBr: String {
        
        let dateFormat = "yyyy-MM-dd"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMM yyyy"
        dateFormatterPrint.locale =  Locale(identifier: "pt_BR")
        if let date = dateFormatter.date(from: self) {
            return  dateFormatterPrint.string(from: date)
        }
        return ""
    }
}
