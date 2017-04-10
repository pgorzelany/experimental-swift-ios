//
//  Settings.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 10/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import Foundation

class Settings {
    
    // MARK: Keys
    
    private enum Keys: String {
        case backendUrl
    }
    
    // MARK: Shared instance
    
    static let shared = Settings()
    
    // MARK: Properties
    
    private var storage = UserDefaults.standard
    
    var backendUrl: String {
        get {
            return self.storage.object(forKey: Keys.backendUrl.rawValue) as? String ?? ""
        } set {
            self.storage.set(newValue, forKey: Keys.backendUrl.rawValue)
        }
    }
}
