//
//  RepositoryService.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/17/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import Foundation
import PromiseKit

protocol RepositoryService : NetworkManagerInjector {
    func findAll( page : Int ) -> Promise<[Repository]>
}

extension RepositoryService {
    
    // MARK: Get repositories
    /// load all repositories page by page from api
    func findAll( page : Int) -> Promise<[Repository]> {
        return Promise { resolver in
            networkManager.executeQuery(request: RepositoryRouter.getLast30Days( page: page ))
                .done{ ( jsonResponse : [String : Any]? ) in
                    var repositories : [Repository] = []
                    let items = jsonResponse?["items"] as! [[String : Any]]
                    
                    for item in items {
                        if let newRepository = Repository(json: item) {
                            repositories.append(newRepository)
                        }
                    }
                    resolver.fulfill(repositories)
            }.catch { (error) in
                print("Something went wrong: \(error.localizedDescription)")
                resolver.reject(error)
            }
        }
    }
    
}
