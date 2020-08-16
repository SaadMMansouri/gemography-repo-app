//
//  ViewModelable.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/15/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import UIKit

protocol ViewModelable {
    
    associatedtype ViewModelType
    var dataSource : GenericDataSource<ViewModelType> { get set }
    
    func mustShowIndicator() -> Bool
    func fetchData()
    
}

extension ViewModelable {
    func mustShowIndicator() -> Bool {
        dataSource.data.value.count == 0
    }
    func fetchData() {}
}
