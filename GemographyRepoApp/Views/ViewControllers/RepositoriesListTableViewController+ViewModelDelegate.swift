//
//  RepositoriesListTableViewController+ViewModelDelegate.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/15/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import UIKit

// MARK: - ViewModelDelegate

extension RepositoriesListTableViewController : ViewModelDelegate {
    func didStartFetchingData() {
        showSpinner()
    }

    func didFinishFetchingData() {
        tableView.reloadData()
        hideSpinner()
    }
}
