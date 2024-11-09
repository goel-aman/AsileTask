//
//  NetworkManager.swift
//  AsileTask
//
//  Created by aman on 05/11/24.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case Network(Error?)
}

class NetworkManager {
    func request<T: Codable>(url: String, token: String = "") async throws -> T {
        guard let url = URL(string: url) else {
            throw DataError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    // T (the request body type, Codable).
    // U (the expected response type, also Codable).
    func postRequest<T: Codable, U: Codable>(url: String, body: T) async throws -> U {
        guard let url = URL(string: url) else {
            throw DataError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let jsonData = try JSONEncoder().encode(body)
        request.httpBody = jsonData

        let (data, response) = try await URLSession.shared.data(for: request)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }

        return try JSONDecoder().decode(U.self, from: data)
    }
}
