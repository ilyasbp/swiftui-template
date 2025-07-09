//
//  LoginViewModel.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//

import Combine
import Foundation

@MainActor
final class LoginViewModel: BaseViewModel {
    // MARK: - Input

    @Published var username: String = ""
    @Published var password: String = ""

    // MARK: - API Call

    func login() {
        runAsync {
            let response: LoginModel = try await APIService.post(
                urlString: APIPath.Auth.login,
                parameters: [
                    "phone": self.username,
                    "password": self.password
                ],
                functionName: #function,
                fileName: #fileID
            )
            self.setupUserData(response)
        }
    }

    // MARK: - Helper

    private func setupUserData(_ loginModel: LoginModel) {
        AuthSession.isLoggedIn = true
        AuthSession.token = loginModel.meta.token

        UserProfile.name = loginModel.data.name
        UserProfile.email = loginModel.data.email
        UserProfile.phone = loginModel.data.phone
    }
}
