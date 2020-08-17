//
//  UIImageView+URL.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/17/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
