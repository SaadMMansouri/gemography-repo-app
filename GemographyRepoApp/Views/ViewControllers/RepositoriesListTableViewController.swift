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
    
    // MARK: Data Propreties
    
    // MARK: Initializers

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupViewUI()
        initData()
    }

    // MARK: Data Initializer
    func initData() {
        tableView.dataSource = RepositoryDataSource()
    }
    
    // MARK: UI Initializer
    func setupViewUI() {
        refreshControl = viewRefreshControl
        // Display Edit button in the navigation bar
        navigationItem.rightBarButtonItem = editButtonItem
        // to eliminate extra separators below UITableView
        tableView.tableFooterView = UIView()
    }

}

// MARK: - Handlers
extension RepositoriesListTableViewController {
    
    @objc func refreshData() {
        tableView.reloadData()
    }
    
}
