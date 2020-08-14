//
//  Observer.swift
//  GemographyRepoApp
//
//  Created by MANSOURI Saad on 8/14/20.
//  Copyright © 2020 MANSOURI Saad. All rights reserved.
//

import Foundation

typealias CompletionHandler = (() -> Void)

class Observer<T> {
    
    // MARK: Propreties

    var value : T {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: CompletionHandler]()
    
    // MARK: Initializer
    
    init(_ value: T) {
        self.value = value
    }
    
    // MARK: Functions
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    private func notify() {
        observers.forEach({ $0.value() })
    }
    
    // MARK: Deinitialization
    
    deinit {
        observers.removeAll()
    }
}
