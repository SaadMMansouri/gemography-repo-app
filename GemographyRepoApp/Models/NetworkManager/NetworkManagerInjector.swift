//
//  NetworkManagerInjector.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/14/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import Foundation

protocol NetworkManagerInjector {
    var networkManager: NetworkManager { get }
}

fileprivate var sharedNetworkManager: NetworkManager {
    return NetworkManager.sharedInstance
}

extension NetworkManagerInjector {
    var networkManager: NetworkManager {
        return sharedNetworkManager
    }
}
