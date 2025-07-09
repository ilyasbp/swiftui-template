//
//  APIError.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 07/07/25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case badServerResponse
    case invalidURL
    case timeout
    case unknown
    case parsingFailed
    case message(String)

    var description: String {
        switch self {
        case .badServerResponse:
            return "Server tidak merespons dengan benar. Silakan coba lagi nanti"
        case .invalidURL:
            return "URL tidak valid"
        case .unknown:
            return "Terjadi kesalahan pada server. Silahkan coba lagi nanti"
        case .timeout:
            return "Koneksi tidak stabil. Silahkan cek internet Anda"
        case .parsingFailed:
            return "Terjadi kesalahan saat pemrosesan data. Silahkan coba lagi nanti"
        case .message(let message):
            return message
        }
    }
}

extension APIError {
    static func from(_ error: Error) -> APIError {
        if let urlError = error as? URLError, urlError.code == .timedOut {
            return .timeout
        }
        if let apiError = error as? APIError {
            return apiError
        }
        return .unknown
    }
}
