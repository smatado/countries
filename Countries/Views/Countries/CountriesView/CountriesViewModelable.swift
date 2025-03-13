//
//  CountriesViewModelable.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import Foundation

/// Represents the different states of the countries view model.
enum CountriesViewModelState: Equatable {

    /// The initial state.
    case initial
    /// The loading state.
    case loading
    /// The success state with a list of country view models.
    case success([CountryItemViewModel])
    /// The error state with a view model error.
    case error(CountriesViewModelError)
}

/// A protocol for the countries view model.
@MainActor
protocol CountriesViewModelable: ObservableObject {
    
    /// The current state of the view model.
    var state: CountriesViewModelState { get }
    /// Fetches the list of countries.
    func fetchCountries() async
}
