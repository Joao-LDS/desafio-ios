//
//  APODTableViewController.swift
//  desafio-ios
//
//  Created by João Luis Santos on 16/11/20.
//

import UIKit

class APODTableViewController: UIViewController {
    
    let viewModel: APODTableViewModel
    var uiview: APODTableView
    
    init(viewModel: APODTableViewModel) {
        self.viewModel = viewModel
        uiview = APODTableView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = uiview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.delegate = self
        viewModel.fetchApods()
        uiview.activityIndicator.startAnimating()
    }

    func setupTableView() {
        uiview.tableView.dataSource = self
        uiview.tableView.delegate = self
        uiview.tableView.register(APODCellView.self, forCellReuseIdentifier: "cell")
    }

}

extension APODTableViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! APODCellView
        let title = viewModel.getTitle(at: indexPath.row)
        let date = viewModel.getDate(at: indexPath.row)
        cell.configureCell(with: title, and: date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let apod = viewModel.apods[indexPath.row]
        let viewModel = APODDetailViewModel(apod: apod)
        let vc = APODDetailViewController(viewModel: viewModel)
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.fetchApodsWhenDisplay(at: indexPath.row)
    }

}

extension APODTableViewController: APODTableViewModelProtocol {
    func reloadTableView() {
        uiview.tableView.reloadData()
        uiview.activityIndicator.stopAnimating()
        uiview.tableView.isHidden = false
    }
}
