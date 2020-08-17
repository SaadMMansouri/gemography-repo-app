//
//  APIError.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/17/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import Foundation

enum APIError: Error {
    
    case requestFailed(Error)
    case invalidParameters
    case invalidData
    case noDataReceived
    case jsonConversionFailure
    case jsonParsingFailure
    case noConnection
    case unknown

    var localizedDescription: String {

        switch self {
            
        case .requestFailed(let error):
            return "Request Failed : " + error.localizedDescription
            
        case .invalidParameters:
            return "Invalid parameters"
            
        case .invalidData:
            return "Invalid received Data"
            
        case .noDataReceived:
            return "Response is empty, no data has been received"

        case .jsonConversionFailure:
            return "JSON Parsing Failure"
            
        case .jsonParsingFailure:
            return "JSON Conversion Failure"

        case .noConnection:
            return "No Internet Connection"
        case .unknown:
            return "Unknown error"
        }
    }
}

extension APIError : Equatable {
    static func == (lhs: APIError, rhs: APIError) -> Bool {
        return lhs.localizedDescription == rhs.localizedDescription
    }

}
