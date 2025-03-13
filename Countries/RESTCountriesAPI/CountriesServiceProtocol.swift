//
//  RESTCountriesServiceProtocol.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import Foundation

/// A service for fetching country data.
protocol CountriesServiceProtocol {
    
    /// Retrieves all countries.
    func fetchAllCountries() async throws -> [Country]
}
