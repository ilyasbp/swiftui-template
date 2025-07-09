//
//  UserProperty.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//

import Foundation

@propertyWrapper
public struct UserProperty<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
