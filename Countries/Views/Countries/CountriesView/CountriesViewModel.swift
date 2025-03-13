//
//  CountriesViewModel.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import Foundation

@MainActor
final class CountriesViewModel: CountriesViewModelable, ObservableObject {

    @Published var state: CountriesViewModelState = .initial
    
    private let countriesService: CountriesServiceProtocol

    init(countriesService: CountriesServiceProtocol = RESTCountriesService()) {
        self.countriesService = countriesService
    }

    func fetchCountries() async {
        state = .loading

        do {
            let allCountries = try await countriesService.fetchAllCountries()
            let viewModels = viewModels(from: allCountries)
            state = .success(viewModels)
        } catch {
            state = .error(.fetchingCountries)
        }
    }

    private func viewModels(from countries: [Country]) -> [CountryItemViewModel] {
        countries
            .sorted { $0.name < $1.name }
            .map { CountryItemViewModel(country: $0) }
    }
}
