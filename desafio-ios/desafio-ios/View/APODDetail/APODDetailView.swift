//
//  APODDetailView.swift
//  desafio-ios
//
//  Created by João Luis Santos on 20/11/20.
//

import UIKit
import WebKit

class APODDetailView: UIView {
    
    lazy var mediaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var closeButton: UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageCloseButton: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollview: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var webView: WKWebView = {
        let view = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var zoomBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageZoomBtn: UIImageView = {
        let view = UIImageView()
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
    
    lazy var explanationLbl: UILabel = {
        let view = UILabel()
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

extension APODDetailView: ConfigureView {
    func addComponent() {
        addSubview(scrollview)
        scrollview.addSubview(imageView)
        scrollview.addSubview(webView)
        scrollview.addSubview(titleLbl)
        scrollview.addSubview(dateLbl)
        scrollview.addSubview(explanationLbl)
        closeButton.addSubview(imageCloseButton)
        scrollview.addSubview(closeButton)
        zoomBtn.addSubview(imageZoomBtn)
        scrollview.addSubview(zoomBtn)
    }
    
    func addConstraint() {
        NSLayoutConstraint.activate([
            scrollview.topAnchor.constraint(equalTo: topAnchor),
            scrollview.leftAnchor.constraint(equalTo: leftAnchor),
            scrollview.rightAnchor.constraint(equalTo: rightAnchor),
            scrollview.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 25),
            closeButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 25),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.widthAnchor.constraint(equalToConstant: 50),
            
            imageCloseButton.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor),
            imageCloseButton.centerXAnchor.constraint(equalTo: closeButton.centerXAnchor),
            imageCloseButton.heightAnchor.constraint(equalToConstant: 50),
            imageCloseButton.widthAnchor.constraint(equalToConstant: 50),
            
            zoomBtn.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -25),
            zoomBtn.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -25),
            zoomBtn.heightAnchor.constraint(equalToConstant: 50),
            zoomBtn.widthAnchor.constraint(equalToConstant: 50),
            
            imageZoomBtn.centerYAnchor.constraint(equalTo: zoomBtn.centerYAnchor),
            imageZoomBtn.centerXAnchor.constraint(equalTo: zoomBtn.centerXAnchor),
            imageZoomBtn.heightAnchor.constraint(equalToConstant: 40),
            imageZoomBtn.widthAnchor.constraint(equalToConstant: 40),
            
            imageView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.trailingAnchor.constraint(equalTo: scrollview.safeAreaLayoutGuide.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: scrollview.safeAreaLayoutGuide.leadingAnchor),
            
            webView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300),
            webView.trailingAnchor.constraint(equalTo: scrollview.safeAreaLayoutGuide.trailingAnchor),
            webView.leadingAnchor.constraint(equalTo: scrollview.safeAreaLayoutGuide.leadingAnchor),
            
            titleLbl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLbl.leadingAnchor.constraint(equalTo: scrollview.layoutMarginsGuide.leadingAnchor, constant: 10),
            titleLbl.trailingAnchor.constraint(equalTo: scrollview.layoutMarginsGuide.trailingAnchor, constant: 10),
            
            dateLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 20),
            dateLbl.leadingAnchor.constraint(equalTo: scrollview.layoutMarginsGuide.leadingAnchor, constant: 10),
            
            explanationLbl.topAnchor.constraint(equalTo: dateLbl.bottomAnchor, constant: 20),
            explanationLbl.leadingAnchor.constraint(equalTo: scrollview.layoutMarginsGuide.leadingAnchor, constant: 10),
            explanationLbl.trailingAnchor.constraint(equalTo: scrollview.layoutMarginsGuide.trailingAnchor, constant: -10),
            explanationLbl.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor, constant: -50)
        ])
    }
    
    func additionalConfig() {
        backgroundColor = .white
        
        closeButton.backgroundColor = .white
        closeButton.layer.cornerRadius = 25
        closeButton.layer.borderColor = UIColor(named: "principal_color")?.cgColor
        closeButton.layer.borderWidth = 1
        
        imageCloseButton.image = UIImage(named: "voltar")
        
        webView.configuration.allowsInlineMediaPlayback = true
        
        zoomBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        zoomBtn.layer.cornerRadius = 25
        
        imageZoomBtn.image = UIImage(named: "expandir")
        
        titleLbl.font = UIFont(name: "Nasa", size: 22)
        titleLbl.textColor = UIColor(named: "principal_color")
        titleLbl.numberOfLines = 0
        
        dateLbl.font = UIFont(name: "Nasa", size: 16)
        dateLbl.textColor = UIColor(named: "principal_color")
        
        explanationLbl.numberOfLines = 0
        explanationLbl.textAlignment = .justified
        explanationLbl.font = UIFont(name: "Nasa", size: 16)
        explanationLbl.textColor = UIColor(named: "principal_color")
    }
    
    
}
