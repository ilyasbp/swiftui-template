//
//  Dictionary+PrettyPrint.swift
//  EcareKit
//
//  Created by Ilyas Bintang Prayogi on 24/05/25.
//

import Foundation

extension Dictionary {
    var prettyPrintedJSON: String {
        guard
            let data = try? JSONSerialization.data(
                withJSONObject: self,
                options: [.prettyPrinted]
            ),
            let string = String(
                data: data,
                encoding: .utf8
            )
        else {
            return "\(self)"
        }
        return string
    }
}

