//
//  UserKeychain.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//

import Foundation
import Security

@propertyWrapper
public struct UserKeychain {
    let key: String
    let defaultValue: String

    init(_ key: String, defaultValue: String) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue: String {
        get {
            return loadFromKeychain()
        }
        set {
            deleteFromKeychain()

            if newValue.isEmpty { return }

            saveToKeychain(value: newValue)
        }
    }

    private func loadFromKeychain() -> String {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne,
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess, let data = dataTypeRef as? Data {
            return String(data: data, encoding: .utf8) ?? ""
        }
        return ""
    }

    private func saveToKeychain(value: String) {
        guard let data = value.data(using: .utf8) else { return }

        let keychainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data,
        ]

        SecItemAdd(keychainQuery as CFDictionary, nil)
    }

    private func deleteFromKeychain() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
        ]

        SecItemDelete(query as CFDictionary)
    }
}
