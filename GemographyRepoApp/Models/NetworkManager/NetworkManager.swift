//
//  NetworkManager.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/14/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import UIKit
import PromiseKit
import Alamofire

final class NetworkManager {
    
    // MARK: Attributes
    private let session : Session

    // MARK: Accessors
    static var sharedInstance: NetworkManager = {
        NetworkManager( sessionManager: Session() )
    }()
    
    // MARK: Initializer
    private init( sessionManager : Session) {
        session = sessionManager
    }
    
}

// MARK: - Functions -

extension NetworkManager {
    
    func executeQuery(request: Alamofire.URLRequestConvertible ) -> Promise<[String : Any]?> {
        return Promise { resolver in
            session.request(request).validate().responseJSON { (response) in
                guard let data = response.data else {
                    guard let afError = response.error else {
                        resolver.reject(APIError.noDataReceived)
                        return
                    }
                    resolver.reject(APIError.requestFailed(afError))
                    return
                }
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    resolver.fulfill(json)
                } catch _ {
                    resolver.reject(APIError.jsonConversionFailure)
                }

            }
        }
    }
    
}


