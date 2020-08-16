//
//  Owner.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/13/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import Foundation

struct Owner : Codable {

    // MARK: Propreties
    
    let id          : Int
    let name        : String
    let avatar      : String
    
    // MARK: Initialization

    init?(json: [String: Any]) {
        guard let idJSON        = json["id"] as? Int,
            let loginJSON       = json["login"] as? String,
            let avatarUrlJSON   = json["avatar_url"] as? String
            else {
                return nil
        }

        self.id                 = idJSON
        self.name               = loginJSON
        self.avatar             = avatarUrlJSON
    }
    
}
