//
//  RepositoryTableViewCell.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/14/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    // MARK: UI Proprities
    
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var repoOwnerNameLabel: UILabel!
    @IBOutlet weak var numberOfStarsLabel: UILabel!
    @IBOutlet weak var repoOwnerAvatarImageView: UIImageView!
    
    // MARK: Data Proprities
    
    // MARK: Update Content
    func updateUIContent() {}

}
