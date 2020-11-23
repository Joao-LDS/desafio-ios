//
//  ConfigureView.swift
//  desafio-ios
//
//  Created by João Luis Santos on 17/11/20.
//

import Foundation

protocol ConfigureView {
    func addComponent()
    func addConstraint()
    func additionalConfig()
}

extension ConfigureView {
    func setupView() {
        addComponent()
        addConstraint()
        additionalConfig()
    }
}
