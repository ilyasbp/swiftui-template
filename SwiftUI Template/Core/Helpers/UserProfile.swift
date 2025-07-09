//
//  UserProfile.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//

import Foundation

public enum UserProfile {
    
    @UserProperty("name", defaultValue: "")
    public static var name: String
    
    @UserProperty("email", defaultValue: "")
    public static var email: String
    
    @UserProperty("phone", defaultValue: "")
    public static var phone: String
}
