//
//  ZoomView.swift
//  desafio-ios
//
//  Created by João Luis Santos on 23/11/20.
//

import UIKit

class ZoomView: UIView {

    lazy var closeButton: UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageButton: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var messageLbl: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
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

extension ZoomView: ConfigureView {
    func addComponent() {
        addSubview(scrollView)
        scrollView.addSubview(imageView)
        closeButton.addSubview(imageButton)
        scrollView.addSubview(closeButton)
        scrollView.addSubview(activityIndicator)
        scrollView.addSubview(messageLbl)
    }
    
    func addConstraint() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25),
            closeButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 25),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.widthAnchor.constraint(equalToConstant: 50),
            
            imageButton.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor),
            imageButton.centerXAnchor.constraint(equalTo: closeButton.centerXAnchor),
            imageButton.heightAnchor.constraint(equalToConstant: 50),
            imageButton.widthAnchor.constraint(equalToConstant: 50),
            
            imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            activityIndicator.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            messageLbl.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: 50),
            messageLbl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    func additionalConfig() {
        backgroundColor = .white
        
        closeButton.backgroundColor = .white
        closeButton.layer.cornerRadius = 25
        closeButton.layer.borderColor = UIColor(named: "principal_color")?.cgColor
        closeButton.layer.borderWidth = 1
        
        imageButton.image = UIImage(named: "voltar")
        
        messageLbl.textColor = UIColor(named: "principal_color")
        messageLbl.font = UIFont(name: "Nasa", size: 18)
        messageLbl.numberOfLines = 0
        messageLbl.textAlignment = .center
        
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 1
        
        imageView.contentMode = .scaleAspectFit
    }
    
    
}
