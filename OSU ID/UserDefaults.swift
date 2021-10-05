//
//  UserDefaults.swift
//  OSU ID
//
//  Created by Oliver Elliott on 10/5/21.
//

import Foundation


extension UserDefaults {
    
    enum Keys: String {
        case idNumber = "idNumber"
        case name = "name"
    }
    
    static func getString(key: Keys) -> String? {
        return UserDefaults.standard.string(forKey: key.rawValue)
    }
    
    static func getBool(key: Keys) -> Bool {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    static func getInt(key: Keys) -> Int {
        return UserDefaults.standard.integer(forKey: key.rawValue)
    }
    
    static func getArray(key: Keys) -> [Any]? {
        return UserDefaults.standard.array(forKey: key.rawValue)
    }
    
    static func save(_ data: Any?, key: Keys) {
        UserDefaults.standard.set(data, forKey: key.rawValue)
    }
}
