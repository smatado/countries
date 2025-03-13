//
//  CountryDetailViewModel.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import Foundation

struct CountryDetailViewModel: Hashable {

    let flagURL: URL?
    let name: String
    let formattedPopulation: String
    let formattedContinents: String
    let formattedCapital: String

    private let detailNotAvailable = NSLocalizedString("countries.detail.notAvailable", comment: "")

    init(country: Country) {
        self.flagURL = country.flagURL
        self.name = country.name
        self.formattedPopulation = country.population.flatMap(String.formatted) ?? detailNotAvailable
        self.formattedContinents = country.continents?.joined(separator: ", ") ?? detailNotAvailable
        self.formattedCapital = country.capital?.joined(separator: ", ") ?? detailNotAvailable
    }
}

private extension String {
    static func formatted(_ int: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter.string(for: int)
    }
}
