//
//  CountriesViewModelError.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import Foundation

enum CountriesViewModelError {
    case fetchingCountries
}

extension CountriesViewModelError: LocalizedError {

    var failureReason: String? {
        NSLocalizedString(
            "countries.failureReason",
            comment: "The reason why fetching countries data failed."
        )
    }

    var errorDescription: String? {
        NSLocalizedString(
            "countries.errorDescription",
            comment: "Describes the error that occurred when fetching countries data."
        )
    }
}
