//
//  APIPath.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//

enum APIPath {
    static let baseURL = "https://staging-apiecare.honda-indonesia.com"

    enum Auth {
        static let login = baseURL + "/auth/login"
        static let register = baseURL + "/auth/register"
    }

    enum Profile {
        static let detail = baseURL + "/profile/detail"
        static let update = baseURL + "/profile/update"
    }
}
