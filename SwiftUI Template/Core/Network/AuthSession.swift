//
//  AuthSession.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//


import Foundation

public enum AuthSession {

    @UserKeychain("token", defaultValue: "")
    public static var token: String

    @UserProperty("isLoggedIn", defaultValue: false)
    public static var isLoggedIn: Bool

    public static func logout() {
        token = ""
        isLoggedIn = false
    }
}
