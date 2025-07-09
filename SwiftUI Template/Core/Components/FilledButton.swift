//
//  FilledButton.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 10/07/25.
//

import SwiftUI

struct FilledButton: View {
    let title: String
    let isLoading: Bool
    let isDisabled: Bool

    // Opsional
    var systemImage: String? = nil
    var backgroundColor: Color = .blue
    var cornerRadius: CGFloat = 12

    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if isLoading {
                    Spinner()
                } else {
                    if let systemImage {
                        Image(systemName: systemImage)
                            .foregroundColor(.white)
                    }
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                    .opacity(isDisabled ? 0.6 : 1.0)
            )
        }
        .disabled(isDisabled)
    }
}

#Preview {
    VStack(spacing: 16) {
        FilledButton(
            title: "Login",
            isLoading: false,
            isDisabled: false,
        ) { print("Login tapped") }

        FilledButton(
            title: "Login",
            isLoading: false,
            isDisabled: false,
            systemImage: "lock.fill",
        ) {}

        FilledButton(
            title: "Loading...",
            isLoading: true,
            isDisabled: true,
            systemImage: "arrow.right",
        ) {}
        
        FilledButton(
            title: "Disabled",
            isLoading: false,
            isDisabled: true,
        ) {}
        
        FilledButton(
            title: "Red",
            isLoading: false,
            isDisabled: false,
            backgroundColor: .red
        ) {}
        
        FilledButton(
            title: "Red Capsule",
            isLoading: false,
            isDisabled: false,
            backgroundColor: .red,
            cornerRadius: 25
        ) {}
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}
