//
//  CountriesServiceMock.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import Foundation

let mockedCountriesInRandomOrder = [
    Country(name: "Country C", flagURL: nil, continents: nil, population: nil, capital: nil),
    Country(name: "Country A", flagURL: nil, continents: nil, population: nil, capital: nil),
    Country(name: "Country B", flagURL: nil, continents: nil, population: nil, capital: nil)
]

final class CountriesServiceMock: CountriesServiceProtocol {
    
    var mockResult: Result<[Country], Error>?
    
    func fetchAllCountries() async throws -> [Country] {
        
        switch mockResult {
        case .success(let countries):
            return countries
        case .failure(let error):
            throw error
        case .none:
            return []
        }
    }
}
