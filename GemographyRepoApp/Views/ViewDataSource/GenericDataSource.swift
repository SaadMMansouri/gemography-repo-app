//
//  GenericDataSource.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/14/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import Foundation

class GenericDataSource<T> : NSObject {
    
    var data: Observer<[T]> = Observer([])
    var count : Int {
        data.value.count
    }
    
}
