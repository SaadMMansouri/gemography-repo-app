//
//  RepositoryRouter.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/14/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import Alamofire

enum RepositoryRouter {
    case getLast30Days( page : Int = 0)
}

extension RepositoryRouter : HTTPRoutable {

    var baseURL: String { AppConstants.SERVER_URL }
    
    var path: String {
        switch self {
        case .getLast30Days:
            return "repositories"
        }
    }
    
    var method: HTTPMethod { .get }
    var headers: HTTPHeaders? { prepareHeaders() }
    
    var parameters: Parameters? {
        switch self {
        case .getLast30Days( let page ):
            // get date of the 30 day before
            let the30daysBefore = Calendar.current.date(byAdding:.day, value:-30, to: Date())!
            // convert date to string
            let stringDate = the30daysBefore.toString(withFormat: "yyyy-MM-dd")
            
            var params = ["q": "created:>\(stringDate)", "sort": "stars", "order": "desc"]
            if page >= 2 {
                params["page"] = "\(page)"
            }
            return params
        }
    }

    
}
