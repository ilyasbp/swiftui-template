//
//  LoginView.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var vm = LoginViewModel()
    @State private var isPasswordVisible = false
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                // Header
                VStack(spacing: 8) {
                    Text("Selamat Datang")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Silakan masuk ke akun Anda")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                // Form Fields
                VStack(spacing: 24) {
                    // Email Field
                    CustomTextField(
                        placeholder: "Username",
                        text: $vm.username,
                    )
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    
                    // Password Field
                    PasswordTextField(
                        placeholder: "Password",
                        isVisible: $isPasswordVisible,
                        text: $vm.password,
                    )
                    .textContentType(.password)
                }
                .padding(.bottom, 16)
                
                // Forgot Password Button
                HStack {
                    Spacer()
                    Button("Lupa Password?") {
                        // Handle forgot password
                        print("Forgot password tapped")
                    }
                    .font(.footnote)
                    .foregroundColor(.blue)
                }
                .padding(.bottom, 32)
                
                // Login Button
                Button(action: {
                    vm.login()
                }) {
                    HStack {
                        if vm.isLoading {
                            Spinner()
                        }
                        else {
                            Text("Masuk")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue)
                            .opacity(vm.username.isEmpty || vm.password.isEmpty || vm.isLoading ? 0.6 : 1.0)
                    )
                }
                .disabled(vm.username.isEmpty || vm.password.isEmpty || vm.isLoading)
                
                Spacer()
                
                // Sign Up Link
                HStack {
                    Text("Belum punya akun?")
                        .foregroundColor(.secondary)
                    
                    Button("Daftar") {
                        // Handle sign up
                        print("Sign up tapped")
                    }
                    .foregroundColor(.blue)
                }
                .font(.footnote)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 32)
            .navigationBarHidden(true)
            .alert(
                vm.errorMessage,
                isPresented: $vm.errorMessage.isPresenting,
                actions: {}
            )
        }
    }
}

#Preview {
    LoginView()
}
