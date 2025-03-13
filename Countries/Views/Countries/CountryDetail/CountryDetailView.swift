//
//  CountryDetailView.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import SwiftUI

struct CountryDetailView: View {
    
    let viewModel: CountryDetailViewModel
    
    var body: some View {
        List {
            FlagImage(url: viewModel.flagURL)
            
            Text(viewModel.name)
                .font(.title3)
                .fontWeight(.bold)
                .fontDesign(.rounded)
            
            detailRow(title: NSLocalizedString("countries.detail.continents", comment: ""), detail: viewModel.formattedContinents)

            detailRow(title: NSLocalizedString("countries.detail.population", comment: ""), detail: viewModel.formattedPopulation)

            detailRow(title: NSLocalizedString("countries.detail.capital", comment: ""), detail: viewModel.formattedCapital)
        }
        .listStyle(.grouped)
    }
        
    private func detailRow(title: String, detail: String) -> some View {
        HStack {
            Text(title)
                .fontDesign(.rounded)
            Spacer()
            Text(detail)
                .fontDesign(.rounded)
                .foregroundStyle(.secondary)
        }
    }
    

}

#Preview {
    CountryDetailView(viewModel: CountryDetailViewModel(country: mockedCountriesInRandomOrder.first!))
}
