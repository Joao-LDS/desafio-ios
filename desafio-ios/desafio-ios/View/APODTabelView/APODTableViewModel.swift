//
//  APODTableViewModel.swift
//  desafio-ios
//
//  Created by João Luis Santos on 16/11/20.
//

import Foundation

protocol APODTableViewModelProtocol {
    func reloadTableView()
}

class APODTableViewModel {
    
    var apods: [APOD] = []
    let service = APODService()
    var delegate: APODTableViewModelProtocol?
    var numberOfRows: Int { return apods.count }
    var numberOfWillDiplay: Int { return apods.count - 15 }
    
    func fetchApods() {
        service.request { apods in
            if let apods = apods {
                self.apods += apods.reversed()
                self.delegate?.reloadTableView()
            }
        }
    }
    
    func fetchApodsWhenDisplay(at index: Int) {
        if numberOfWillDiplay == index {
            fetchApods()
        }
    }
    
    func getTitle(at index: Int) -> String {
        return apods[index].title
    }
    
    func getDate(at index: Int) -> String {
        return apods[index].date
    }
}
