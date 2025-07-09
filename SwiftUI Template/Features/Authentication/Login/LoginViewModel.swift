//
//  LoginViewModel.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//

import Combine
import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    @Published var shouldNavigate: Bool = false

    private var cancellables = Set<AnyCancellable>()

    func login() {
        isLoading = true
        errorMessage = ""

        Task {
            do {
                let response: LoginModel = try await APIService.post(
                    urlString: APIPath.Auth.login,
                    parameters: [
                        "phone": username,
                        "password": password
                    ],
                    functionName: #function,
                    fileName: #fileID
                )

                setupUserData(response)
            }
            catch {
                errorMessage = APIError.from(error).description
            }
            isLoading = false
        }
    }

    func setupUserData(_ loginModel: LoginModel) {
        AuthSession.isLoggedIn = true
        AuthSession.token = loginModel.meta.token
        
        UserProfile.name = loginModel.data.name
        UserProfile.email = loginModel.data.email
        UserProfile.phone = loginModel.data.phone
        
        shouldNavigate = true
    }
}
