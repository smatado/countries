//
//  HTTPClientProtocol.swift
//  Quotes
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import Foundation

/// An error type for HTTP client operations.
enum HTTPClientError: Equatable {

    /// Indicates an invalid URL.
    case invalidURL
    /// Represents an HTTP error with a status code.
    case httpError(statusCode: Int)
    /// An unknown error occurred.
    case unknown
    /// A decoding error occurred.
    case decoding
}

extension HTTPClientError: LocalizedError {

    /// A human readable description of the error.
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Bad URL format"
        case .httpError(let statusCode):
            return "Request failed with status code: \(statusCode)"
        case .decoding:
            return "Failed to decode the response"
        case .unknown:
            return "An unknown error occurred"
        }
    }
}

/// Represents an HTTP endpoint.
struct Endpoint {
    let url: String
    let parameters: [String: String] = [:]
}

/// A protocol for performing HTTP GET requests.
protocol HTTPClientProtocol {
    
    /// Performs a GET request to the specified endpoint.
    ///
    /// - Parameter endpoint: The target HTTP endpoint.
    /// - Returns: A decoded object of type `T`.
    /// - Throws: An error if the request fails or decoding is unsuccessful.
    func get<T: Codable>(endpoint: Endpoint) async throws -> T
}
