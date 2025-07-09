//
//  CustomTextField.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    var keyboardType: UIKeyboardType = .default
    
    @FocusState private var isFocused: Bool
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Fixed Label Space
            Text(placeholder)
                .font(.caption)
                .foregroundColor(isFocused ? .blue : (text.isEmpty ? .clear : .gray))
                .animation(.easeInOut(duration: 0.1), value: isFocused)
                .animation(.easeInOut(duration: 0.1), value: text.isEmpty)
            
            // Text Field
            TextField(isFocused || !text.isEmpty ? "" : placeholder, text: $text)
                .font(.body)
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(
                            isFocused ? Color.blue : Color.gray.opacity(0.3),
                            lineWidth: isFocused ? 2 : 1
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.systemGray6))
                        )
                )
                .keyboardType(keyboardType)
                .autocorrectionDisabled(true)
        }
        .focused($isFocused)
    }
}

#Preview {
    CustomTextFieldPreview()
}

struct CustomTextFieldPreview: View {
    @State private var username = ""
    @State private var email = ""
    @State private var isPasswordVisible = false
    
    var body: some View {
        VStack(spacing: 24) {
            
            VStack(spacing: 16) {
                CustomTextField(
                    placeholder: "Username",
                    text: $username,
                )
            }
            
            VStack(spacing: 16) {
                CustomTextField(
                    placeholder: "Email",
                    text: $email,
                )
            }
        }
        .padding(24)
        .background(Color(.systemBackground))
    }
}
