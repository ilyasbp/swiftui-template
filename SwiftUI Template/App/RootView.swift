//
//  RootView.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//

import SwiftUI

struct RootView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            MainMenuView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    RootView()
}
