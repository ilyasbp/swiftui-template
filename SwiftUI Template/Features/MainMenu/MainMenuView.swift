//
//  MainMenuView.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        Spacer()
        Text("Main Menu")
        Button("Logout"){
            AuthSession.logout()
        }
        .padding(.top)
        Spacer()
    }
}

#Preview {
    MainMenuView()
}
