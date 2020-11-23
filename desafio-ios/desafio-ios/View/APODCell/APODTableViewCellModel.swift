//
//  APODTableViewCellModel.swift
//  desafio-ios
//
//  Created by João Luis Santos on 16/11/20.
//

import Foundation

class APODTableViewCellModel {
    
    var apod: APOD?
    var title: String? { return apod?.title}
    var date: String? {
        if let date = apod?.date {
            return Utils().formatDate(date: date)
        }
        return ""
    }
    
    
}
