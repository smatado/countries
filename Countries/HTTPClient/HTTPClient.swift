//
//  HTTPClient.swift
//  Quotes
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import Foundation

final class HTTPClient: HTTPClientProtocol {
    
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func get<T: Codable>(endpoint: Endpoint) async throws -> T {
        
        guard var urlComponents = URLComponents(string: endpoint.url) else {
            throw HTTPClientError.invalidURL
        }
                
        urlComponents.queryItems = endpoint.parameters.map { URLQueryItem(name: $0.key, value: $0.value) }

        guard let url = urlComponents.url else {
            throw HTTPClientError.invalidURL
        }

        let request = URLRequest(url: url)

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPClientError.unknown
        }
        
        guard httpResponse.statusCode < 400 else {
            throw HTTPClientError.httpError(statusCode: httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw HTTPClientError.decoding
        }
    }
}
