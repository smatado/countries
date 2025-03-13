//
//  CountryItem.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import SwiftUI

struct CountryItem: View {
    
    let viewModel: CountryItemViewModel
    private let flagSize = CGSize.init(width: 60.0, height: 40.0)
        
    var body: some View {
        HStack {
            FlagImage(url: viewModel.flagURL)
                .frame(width: flagSize.width, height: flagSize.height)
            Text(viewModel.countryName)
                .font(.title3)
                .fontWeight(.bold)
                .fontDesign(.rounded)
        }
    }
}

#Preview {
    CountriesView<CountriesViewModelMock>(
        countriesViewModel: CountriesViewModelMock(
            mockedState: .success(countries: mockedCountriesInRandomOrder)
        )
    )
}
