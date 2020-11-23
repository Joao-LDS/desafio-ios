//
//  APODTableViewCell.swift
//  desafio-ios
//
//  Created by João Luis Santos on 16/11/20.
//

import UIKit

class APODTableViewCell: UITableViewCell {
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupCell(With apod: APOD) {
        viewModel.apod = apod
        configureViewCell()
    }
    
    func configureViewCell() {
        dateLbl.text = viewModel.date
        titleLbl.text = viewModel.title
    }

}
