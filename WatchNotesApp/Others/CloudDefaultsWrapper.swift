//
//  CloudDefaultsWrapper.swift
//  WatchNotesApp
//
//  Created by Lucas Leone on 27/06/2024.
//

import Foundation

@propertyWrapper
struct CloudDefault<T: Codable> {
    let key: String
    let defaultValue: T
    let cloudStore: NSUbiquitousKeyValueStore
    
    init(key: String, defaultValue: T, cloudStore: NSUbiquitousKeyValueStore = .default) {
        self.key = key
        self.defaultValue = defaultValue
        self.cloudStore = cloudStore
    }
    
    var wrappedValue: T {
        get {
            guard let data = cloudStore.data(forKey: key) else {
                return defaultValue
            }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            cloudStore.set(data, forKey: key)
        }
    }
}
