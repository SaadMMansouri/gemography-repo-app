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
    func getData<T: Codable>( request: Alamofire.URLRequestConvertible ) -> Promise<T> {
        
        return Promise { resolver in
            session.request(request).responseData(completionHandler: {response in
                debugPrint("loading from api...")
                
                switch response.result{
                case .success(let value):
                    if let code = response.response?.statusCode{
                        switch code {
                        case 200...299:
                            do {
                                // configurate json decoder
                                let decoder = JSONDecoder()
                                decoder.dateDecodingStrategy = .formatted(Formatter.iso8601)
                                
                                // start decoding the received data
                                let data = try decoder.decode(T.self, from: value)
                                
                                // return decoded data
                                resolver.fulfill(data)
                                
                            } catch let error {
                                
                                // convert response value to string to display it in console
                                let receivedResponse = String(data: value, encoding: .utf8)
                                debugPrint( receivedResponse ?? "Nothing received")
                                
                                // return decoding error object
                                resolver.reject(error)
                            }
                            
                        default:
                            
                            // create a custom error base on response code and description
                            let error = NSError(domain: response.debugDescription,
                                code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                            
                            // return the custom error object
                            resolver.reject(error)
                        }
                    }
                case .failure(let error):
                    // return response error object
                    resolver.reject(error)
                }
            })
        }
    }
}


