//
//  APODTableView.swift
//  desafio-ios
//
//  Created by João Luis Santos on 20/11/20.
//

import UIKit

class APODTableView: UIView {

    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lineHeaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var headerImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension APODTableView: ConfigureView {

    func addComponent() {
        addSubview(tableView)
        addSubview(activityIndicator)
        headerView.addSubview(headerImageView)
        headerImageView.addSubview(lineHeaderView)
        addSubview(headerView)
    }
    
    func addConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            headerImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 5),
            headerImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 40),
            headerImageView.widthAnchor.constraint(equalToConstant: 40),
            
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60),
            
            lineHeaderView.heightAnchor.constraint(equalToConstant: 1),
            lineHeaderView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            lineHeaderView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            lineHeaderView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor)
        ])
    }
    
    func additionalConfig() {
        backgroundColor = .white
        
        headerView.backgroundColor = .white
        
        lineHeaderView.backgroundColor = UIColor(named: "principal_color")
        
        headerImageView.image = UIImage(named: "logo-nasa")
        
        tableView.isHidden = true
        tableView.separatorStyle = .none
    }
    
}
