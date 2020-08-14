//
//  UITableViewCell+storyboardID.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/14/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    class var storyboardID : String {
      "\(self)" + "ID"
    }
    
}
