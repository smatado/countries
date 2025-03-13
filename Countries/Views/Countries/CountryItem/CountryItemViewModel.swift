//
//  CountryItemViewModel.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import Foundation

struct CountryItemViewModel: Hashable {

    let countryName: String
    let flagURL: URL?
    let countryDetailViewModel: CountryDetailViewModel

    init(country: Country) {
        self.countryName = country.name
        self.flagURL = country.flagURL
        self.countryDetailViewModel = CountryDetailViewModel(country: country)
    }
}
