//
//  APIService.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//

import Foundation

enum APIService {
    static var headers = [
        "Authorization": "Bearer \(AuthSession.token)",
        "Content-Type": "application/json",
        "Cache-Control": "no-cache"
    ]
    
    static func get<T: Decodable>(
        urlString: String,
        parameters: [String: String],
        functionName: String,
        fileName: String
    ) async throws -> T {
        // SETUP URL + PARAMS
        var components = URLComponents(string: urlString)
        components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        guard let url = components?.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let (data, response) = try await URLSession.shared.data(for: request)
               
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode
        else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    static func post<T: Decodable>(
        urlString: String,
        parameters: [String: String],
        functionName: String,
        fileName: String
    ) async throws -> T {
        // SETUP URL
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        
        print("")
        print("------------------------------------------------------------------------")
        print("🚀 POST Request Started at", functionName, fileName)
        print("------------------------------------------------------------------------")
        print("🔗 URL:", url)
        print("🔑 Headers:\n", headers.prettyPrintedJSON)
        print("🗒️ Parameters:\n", parameters.prettyPrintedJSON)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            print("")
            print("------------------------------------------------------------------------")
            print("📥 Response Received at", functionName, fileName)
            print("------------------------------------------------------------------------")
            print("📦 Response JSON:\n", data.filteredPrettyPrintedJSON)
            print("")
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.badServerResponse
            }
        
            // VALIDATE RESULT
            guard 200..<300 ~= httpResponse.statusCode else {
                let errorResponse = try JSONDecoder().decode(APIMessage.self, from: data)
                throw APIError.message(errorResponse.message)
            }
        
            // DECODE RESULT
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw APIError.parsingFailed
            }
            
        } catch {
            throw error
        }
    }
}
