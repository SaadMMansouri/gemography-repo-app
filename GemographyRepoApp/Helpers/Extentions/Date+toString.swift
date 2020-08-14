//
//  Date+toString.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/14/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import Foundation

extension Date {

    func toString(withFormat format: String = "yyyy'-'MM'-'dd'T'hh':'mm':'ss'.'sss'Z'") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format

        return dateFormatter.string(from: self)
    }
    
}
