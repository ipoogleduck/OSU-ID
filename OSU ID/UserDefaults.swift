//
//  UserDefaults.swift
//  OSU ID
//
//  Created by Oliver Elliott on 10/5/21.
//

import Foundation

let defaultsSuiteName = UserDefaults(suiteName: "group.ipooglecodes.osuid")!

extension UserDefaults {
    
    enum Keys: String {
        case idNumber = "idNumber"
        case name = "name"
    }
    
    static func getString(key: Keys) -> String? {
        return defaultsSuiteName.string(forKey: key.rawValue)
    }
    
    static func getBool(key: Keys) -> Bool {
        return defaultsSuiteName.bool(forKey: key.rawValue)
    }
    
    static func getInt(key: Keys) -> Int {
        return defaultsSuiteName.integer(forKey: key.rawValue)
    }
    
    static func getArray(key: Keys) -> [Any]? {
        return defaultsSuiteName.array(forKey: key.rawValue)
    }
    
    static func save(_ data: Any?, key: Keys) {
        defaultsSuiteName.set(data, forKey: key.rawValue)
    }
}
