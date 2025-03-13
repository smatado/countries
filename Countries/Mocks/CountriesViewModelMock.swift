//
//  CountriesViewModelMock.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import Foundation

class CountriesViewModelMock: CountriesViewModelable {

    enum MockedState {
        case loading
        case success(countries: [Country])
        case error(error: Error)
    }
    
    let mockedState: MockedState

    init(mockedState: MockedState) {
        self.mockedState = mockedState
    }

    var state: CountriesViewModelState {
        switch mockedState {
        case .loading:
            return .loading
        case .success(countries: let countries):
            return .success(countries.map { CountryItemViewModel(country: $0)})
        case .error:
            return .error(.fetchingCountries)
        }
    }

    func fetchCountries() async { }
}
