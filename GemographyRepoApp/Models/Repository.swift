//
//  Repository.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/13/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import Foundation

struct Repository : Codable {

    // MARK: Propreties

    let id          : Int
    let name        : String
    let description : String
    let stars       : Int
    let owner       : Owner

    // MARK: Initialization

    init?(json: [String: Any]) {
        guard let idJSON            = json["id"] as? Int,
            let nameJSON            = json["name"] as? String,
            let descriptionJSON     = json["description"] as? String,
            let starsJSON           = json["stargazers_count"] as? Int,
            let ownerJSON           = json["owner"] as? Owner
            else {
                return nil
        }

        self.id                     = idJSON
        self.name                   = nameJSON
        self.description            = descriptionJSON
        self.stars                  = starsJSON
        self.owner                  = ownerJSON
    }
}
