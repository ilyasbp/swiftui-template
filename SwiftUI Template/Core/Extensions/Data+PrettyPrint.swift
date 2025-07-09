//
//  Data+PrettyPrint.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 07/07/25.
//

import Foundation

extension Data {
    var prettyPrintedJSON: String {
        guard
            let object = try? JSONSerialization.jsonObject(
                with: self,
                options: []
            ),
            let data = try? JSONSerialization.data(
                withJSONObject: object,
                options: [.prettyPrinted]
            ),
            let prettyString = String(
                data: data,
                encoding: .utf8
            )
        else {
            return String(data: self, encoding: .utf8) ?? "❌ Invalid JSON"
        }
        return prettyString
    }

    var filteredPrettyPrintedJSON: String {
        do {
            guard var json = try JSONSerialization.jsonObject(
                with: self,
                options: []
            ) as? [String: Any] else {
                return String(
                    data: self,
                    encoding: .utf8
                ) ?? "❌ Invalid JSON"
            }

            json.removeValue(forKey: "debug")
            json.removeValue(forKey: "errors")

            let cleanedData = try JSONSerialization.data(
                withJSONObject: json,
                options: [.prettyPrinted]
            )
            return String(
                data: cleanedData,
                encoding: .utf8
            ) ?? "❌ Cannot decode"
        } catch {
            return "❌ Error filtering JSON: \(error.localizedDescription)"
        }
    }
}
