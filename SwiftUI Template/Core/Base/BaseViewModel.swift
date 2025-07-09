//
//  BaseViewModel.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 10/07/25.
//

import Combine
import Foundation

@MainActor
class BaseViewModel: ObservableObject {
    // MARK: - Published Properties

    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""

    // MARK: - Combine

    var cancellables = Set<AnyCancellable>()

    // MARK: - API Error Handling

    func handleAPIError(_ error: Error) {
        errorMessage = APIError.from(error).description
    }

    // MARK: - Async Task Wrapper

    func runAsync(_ block: @escaping () async throws -> Void) {
        isLoading = true
        errorMessage = ""
        Task {
            do {
                try await block()
            } catch {
                handleAPIError(error)
            }
            isLoading = false
        }
    }
}
