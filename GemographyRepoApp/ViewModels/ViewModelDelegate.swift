//
//  ViewModelDelegate.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/15/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import UIKit

@objc protocol ViewModelDelegate {
    
    @objc optional func didStartFetchingData()
    @objc optional func didFinishFetchingData()
    
}
