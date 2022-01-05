//
//  UserDefaultsWatch.swift
//  OSU ID Watch WatchKit Extension
//
//  Created by Oliver Elliott on 1/4/22.
//

import Foundation
extension UserDefaults {
    
    enum Keys: String {
        case name = "name"
        case image = "image"
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
    
    static func getData(key: Keys) -> Data? {
        return UserDefaults.standard.object(forKey: key.rawValue) as? Data
    }
    
    static func save(_ data: Any?, key: Keys) {
        UserDefaults.standard.set(data, forKey: key.rawValue)
    }
}
