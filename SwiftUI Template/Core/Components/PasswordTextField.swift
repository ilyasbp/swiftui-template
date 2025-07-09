//
//  PasswordTextField.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//
import SwiftUI

struct PasswordTextField: View {
    
    let placeholder: String
    
    @FocusState private var isFocused: Bool
    @Binding var isVisible: Bool
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Fixed Label Space
            Text(placeholder)
                .font(.caption)
                .foregroundColor(isFocused ? .blue : (text.isEmpty ? .clear : .gray))
                .animation(.easeInOut(duration: 0.1), value: isFocused)
                .animation(.easeInOut(duration: 0.1), value: text.isEmpty)
            
            // Password Field Container
            HStack {
                Group {
                    if isVisible {
                        TextField(isFocused || !text.isEmpty ? "" : placeholder, text: $text)
                            .textContentType(.password)
                    } else {
                        SecureField(isFocused || !text.isEmpty ? "" : placeholder, text: $text)
                            .textContentType(.password)
                    }
                }
                .font(.body)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                
                // Hide/Show Button
                Button(action: {
                    isVisible.toggle()
                }) {
                    Image(systemName: isVisible ? "eye.slash" : "eye")
                        .foregroundColor(isFocused ? .blue : .gray)
                        .frame(width: 24, height: 24)
                }
                .buttonStyle(PlainButtonStyle())
            }
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
        }
        .focused($isFocused)
    }
}

#Preview {
    PreviewContainer()
}

struct PreviewContainer: View {
    @State private var password = ""
    @State private var isPasswordVisible = false
    @State private var confirmPassword = ""
    @State private var isConfirmPasswordVisible = false
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Password Field Demo")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 8)
            
            VStack(spacing: 16) {
                PasswordTextField(
                    placeholder: "Password",
                    isVisible: $isPasswordVisible,
                    text: $password,
                )
                
                PasswordTextField(
                    placeholder: "Confirm Password",
                    isVisible: $isConfirmPasswordVisible,
                    text: $confirmPassword,
                )
            }
            
            // Demo info
            VStack(alignment: .leading, spacing: 8) {
                Text("Features:")
                    .font(.headline)
                    .padding(.top, 16)
                
                Text("• Animated floating label")
                Text("• Toggle visibility button")
                Text("• Focus state indication")
                Text("• Clean, modern design")
            }
            .font(.caption)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding(24)
        .background(Color(.systemBackground))
    }
}
