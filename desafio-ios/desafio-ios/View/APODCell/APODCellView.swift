//
//  APODCellView.swift
//  desafio-ios
//
//  Created by João Luis Santos on 20/11/20.
//

import UIKit

class APODCellView: UITableViewCell {
    
    lazy var viewCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLbl: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dateLbl: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with title: String, and date: String) {
        titleLbl.text = title
        dateLbl.text = date
    }
    
}

extension APODCellView: ConfigureView {
    func addComponent() {
        addSubview(viewCell)
        viewCell.addSubview(titleLbl)
        viewCell.addSubview(dateLbl)
    }
    
    func addConstraint() {
        NSLayoutConstraint.activate([
            viewCell.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            viewCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            viewCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            viewCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            titleLbl.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 16),
            titleLbl.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 22),
            titleLbl.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -22),
            
            dateLbl.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -16),
            dateLbl.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 22),
            dateLbl.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -22)
        ])
    }
    
    func additionalConfig() {
        viewCell.layer.shadowColor = UIColor(named: "principal_color")?.cgColor
        viewCell.layer.shadowRadius = 5
        viewCell.layer.shadowOpacity = 0.5
        viewCell.layer.shadowOffset = .zero
        viewCell.backgroundColor = .white
        viewCell.layer.cornerRadius = 10
        
        titleLbl.textColor = UIColor(named: "principal_color")
        titleLbl.font = UIFont(name: "Nasa", size: 16)
        
        dateLbl.textColor = UIColor(named: "principal_color")
        dateLbl.font = UIFont(name: "Nasa", size: 16)
    }
    
    
}
