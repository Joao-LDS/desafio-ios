//
//  ZoomViewController.swift
//  desafio-ios
//
//  Created by João Luis Santos on 17/11/20.
//

import UIKit

class ZoomViewController: UIViewController {

    let viewModel: ZoomViewModel
    var uiview: ZoomView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiview.scrollView.delegate = self
        configureView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if uiview.imageView.image != nil {
            uiview.activityIndicator.stopAnimating()
            uiview.messageLbl.isHidden = true
        }
    }
    
    init(viewModel: ZoomViewModel) {
        self.viewModel = viewModel
        uiview = ZoomView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.view = uiview
    }

    func configureView() {
        uiview.activityIndicator.startAnimating()
        uiview.closeButton.addTarget(self, action: #selector(self.closeTapped), for: .touchUpInside)
        uiview.imageView.kf.setImage(with: viewModel.hdurl)
        uiview.messageLbl.text = "Por favor aguarde.\n Estamos buscando a melhor imagem..."
    }

    @objc func closeTapped() {
        dismiss(animated: true, completion: nil)
    }

}

extension ZoomViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return uiview.imageView
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = uiview.imageView.image {
                let ratioWidth = uiview.imageView.frame.width / image.size.width
                let ratioHeight = uiview.imageView.frame.height / image.size.height
                let ratio = ratioWidth < ratioHeight ? ratioWidth : ratioHeight

                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio

                let leftCondition = newWidth * scrollView.zoomScale > uiview.imageView.frame.width
                let left = 0.5 * (leftCondition ? newWidth - uiview.imageView.frame.width : (scrollView.frame.width - scrollView.contentSize.width))

                let topCondition = newHeight * scrollView.zoomScale > uiview.imageView.frame.height
                let top = 0.5 * (topCondition ? newHeight - uiview.imageView.frame.height : (scrollView.frame.height - scrollView.contentSize.height))

                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        } else {
            scrollView.contentInset = .zero
        }
    }
}
