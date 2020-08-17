//
//  UIViewController+ActivityIndicator.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/15/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import UIKit

fileprivate var spinnerView : UIView?

extension UIViewController {
    /// add view with activityIndicator to super view and start Animating the activityIndicator
    func showSpinner() {
        
        // get the visible window
        let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow})!
        
        spinnerView = UIView(frame: window.bounds)
        // set your spinner view's center to the center of the screen
        spinnerView!.center = window.center
        
        // add white background to spinner view
        let backgroundView = UIView(frame: spinnerView!.bounds)
        backgroundView.backgroundColor = .white
        spinnerView?.addSubview(backgroundView)

        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = spinnerView!.center
        activityIndicator.color = .purple
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        spinnerView?.addSubview(activityIndicator)

        // add the spinner view to the active window
        // and make sure it is at the front
        window.addSubview(spinnerView!)
        window.bringSubviewToFront(spinnerView!)
    }
    
    /// remove activityIndicator  from superview
    func hideSpinner() {
        if spinnerView != nil {
            UIView.animate( withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                for subview in spinnerView!.subviews {
                    subview.alpha = 0
                }
            }) { _ in
               spinnerView?.removeFromSuperview()
               spinnerView = nil
            }
        }
    }
}
