//
//  RepositoriesListTableViewController.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/14/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import UIKit

class RepositoriesListTableViewController: UITableViewController {
    
    // MARK: UI Propreties
    
    lazy var viewRefreshControl : UIRefreshControl = {
        return CustomRefreshControl(target: self, action: #selector(self.refreshData))
    }()
    lazy var pagingSpinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.color = .purple
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    // MARK: Data Propreties
    
    var currentPage = 1
    lazy var viewModel: RepositoriesListViewModel = {
        return RepositoriesListViewModel(delegate: self)
    }()
    
    // MARK: Initializers

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupViewUI()
        initData()
    }

    // MARK: Data Initializer
    func initData() {
        tableView.dataSource = viewModel.dataSource as? RepositoryDataSource
        viewModel.fetchData(pageNumber: currentPage)
    }
    
    // MARK: UI Initializer
    func setupViewUI() {
        refreshControl = viewRefreshControl
        // to eliminate extra separators
        // and add activity indicator below UItableview
        tableView.tableFooterView = pagingSpinner
    }

}

// MARK: - Delegates

extension RepositoriesListTableViewController {
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cellPage = (indexPath.row + 1)/30 + 1

        if cellPage >= 2 && cellPage > currentPage {
            pagingSpinner.startAnimating()
            viewModel.fetchData(pageNumber: cellPage)
            currentPage = cellPage
        }
        
        self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
     }
    
}

// MARK: - Handlers
extension RepositoriesListTableViewController {
    
    @objc func loadTable() {
        tableView.reloadData()
        pagingSpinner.stopAnimating()
    }
    
    @objc func refreshData() {
        viewModel.fetchData()
    }
}
