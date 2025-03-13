//
//  RESTCountriesService.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import Foundation

final class RESTCountriesService: CountriesServiceProtocol {
    
    private let allEndpoint = "https://restcountries.com/v3.1/all"
    private let httpClient: any HTTPClientProtocol
    
    init(httpClient: any HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    func fetchAllCountries() async throws -> [Country] {
        
        let response: [CountryDTO]
        
        do {
            response = try await httpClient.get(endpoint: Endpoint(url: allEndpoint))
        } catch {
            throw CountriesServiceError.networkFailure
        }
        
        return response.compactMap { (countryDTO) -> Country? in
            guard let name = countryDTO.localizedName else { return nil }
            
            return Country(
                name: name,
                flagURL: URL(string: countryDTO.flags?.png ?? ""),
                continents: countryDTO.continents,
                population: countryDTO.population,
                capital: countryDTO.capital
            )
        }
    }
}

private extension CountryDTO {
    var localizedName: String? {
        if Locale.current.language.languageCode?.identifier == "fr" {
            return translations["fra"]?.common
        } else {
            return name?.common
        }
    }
}

