//
//  CustomRefreshControl.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/14/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import UIKit

class CustomRefreshControl: UIRefreshControl {

    convenience init( target : Any?, action : Selector ) {
        self.init()
        tintColor       = .purple
        backgroundColor = .clear
        addTarget( target, action: action, for: .valueChanged)
    }

}
