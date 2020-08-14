//
//  UITableView+Cells.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/14/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type ) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.storyboardID) as? T else {
            fatalError("Cell with identifier \(type.storyboardID), not found in \(self) TableView")
        }
        return cell
    }
    
}
