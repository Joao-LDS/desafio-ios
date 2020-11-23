//
//  Utils.swift
//  desafio-ios
//
//  Created by João Luis Santos on 17/11/20.
//

import Foundation

class Utils {
    
    func formatDate(date: String) -> String {
        let df = DateFormatter()
        df.dateFormat = "YYYY-MM-dd"
        if let date = df.date(from: date) {
            df.dateFormat = "dd/MM/YYYY"
            let dateStr = df.string(from: date)
            return dateStr
        }
        return ""
    }
}
