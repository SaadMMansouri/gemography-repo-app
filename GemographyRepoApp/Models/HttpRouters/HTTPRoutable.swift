//
//  HTTPRoutable.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/14/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//
import Foundation
import Alamofire

protocol HTTPRoutable : URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
}

extension HTTPRoutable {
    var parameters: Parameters? { nil }
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var request = try URLRequest(
            url: url.appendingPathComponent(path)
                .absoluteString
                .removingPercentEncoding!,
            method: method,
            headers: headers)
        request.timeoutInterval = TimeInterval(10 * 1000)
        let encoding : ParameterEncoding = (method == .get) ? URLEncoding() : JSONEncoding()
        return try encoding.encode(request, with: parameters)
    }
    
    func prepareHeaders() -> HTTPHeaders {
         ["Content-Type": "application/json", "Accept": "application/json"]
    }
    
}
