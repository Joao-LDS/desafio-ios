//
//  APODDetailViewModel.swift
//  desafio-ios
//
//  Created by João Luis Santos on 17/11/20.
//

import Foundation

class APODDetailViewModel {
    
    var apod: APOD
    
    init(apod: APOD) {
        self.apod = apod
    }
    
    func getDateString() -> String {
        return Utils().formatDate(date: self.apod.date)
    }
    
}
