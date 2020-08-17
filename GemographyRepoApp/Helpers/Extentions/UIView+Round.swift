//
//  UIView+Round.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/17/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import UIKit

extension UIView {

    func makeCornersRounded( radius : CGFloat = 0){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius == 0 ? CGFloat(self.frame.width/2) : radius
    }
}
