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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Display Edit button in the navigation bar
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCellID", for: indexPath)

        // Configure the cell...
        return cell
    }


}



// MARK: - Handlers
extension RepositoriesListTableViewController {
    
    @objc func refreshData() {
        tableView.reloadData()
    }
    
}
