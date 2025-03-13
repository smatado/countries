//
//  CountriesApp.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import SwiftUI

@main
struct CountriesApp: App {
    
    var body: some Scene {
        WindowGroup {
            CountriesView<CountriesViewModel>(countriesViewModel: CountriesViewModel())
        }
    }
}
