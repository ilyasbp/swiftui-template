//
//  Binding+String.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 07/07/25.
//

import SwiftUI

extension Binding where Value == String {
    var isPresenting: Binding<Bool> {
        Binding<Bool>(
            get: { self.wrappedValue != "" },
            set: { if !$0 { self.wrappedValue = "" } }
        )
    }
}
