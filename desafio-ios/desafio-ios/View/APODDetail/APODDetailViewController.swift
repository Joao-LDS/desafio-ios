//
//  APODDetailViewController.swift
//  desafio-ios
//
//  Created by João Luis Santos on 16/11/20.
//

import UIKit
import Kingfisher
import WebKit

class APODDetailViewController: UIViewController {
    
    let viewModel: APODDetailViewModel
    let uiview: APODDetailView
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        self.configureView()
    }
    
    init(viewModel: APODDetailViewModel) {
        self.viewModel = viewModel
        self.uiview = APODDetailView()
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = uiview
    }
    
    func configureView() {
        switch viewModel.apod.media_type {
        case "image":
            uiview.webView.isHidden = true
            uiview.imageView.kf.setImage(with: viewModel.apod.url)
        default: //"video"
            uiview.imageView.isHidden = true
            uiview.zoomBtn.isHidden = true
            let req = URLRequest(url: viewModel.apod.url)
            uiview.webView.load(req)
        }
        
        uiview.titleLbl.text = viewModel.apod.title
        uiview.dateLbl.text = viewModel.apod.date
        uiview.explanationLbl.text = viewModel.apod.explanation
        uiview.closeButton.addTarget(self, action: #selector(self.closeTapped), for: .touchUpInside)
        uiview.zoomBtn.addTarget(self, action: #selector(self.zoomTapped), for: .touchUpInside)
    }
    
    
    @objc func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func zoomTapped() {
        guard let hdurl = viewModel.apod.hdurl else { return }
        let viewModel = ZoomViewModel(hdurl: hdurl)
        let vc = ZoomViewController(viewModel: viewModel)
        present(vc, animated: true, completion: nil)
    }
    
}
