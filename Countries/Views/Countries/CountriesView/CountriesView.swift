//
//  ContentView.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import SwiftUI

struct CountriesView<ViewModel: CountriesViewModelable>: View {

    @StateObject var countriesViewModel: ViewModel

    var body: some View {
        NavigationStack {
            Group {
                switch countriesViewModel.state {
                case .loading:
                    loadingView()
                case .success(let viewModels):
                    countriesList(viewModels: viewModels)
                case .error(let error):
                    errorView(error: error)
                case .initial:
                    EmptyView()
                }
            }
            .navigationTitle("countries.navigation.title")
            .navigationDestination(for: CountryDetailViewModel.self) { viewModel in
                CountryDetailView(viewModel: viewModel)
            }
        }
        .task {
            await countriesViewModel.fetchCountries()
        }
    }

    private func loadingView() -> some View {
        ProgressView()
            .controlSize(.extraLarge)
    }

    private func countriesList(viewModels: [CountryItemViewModel]) -> some View {
        List(viewModels, id: \.self) { viewModel in
            NavigationLink(value: viewModel.countryDetailViewModel) {
                CountryItem(viewModel: viewModel)
            }
        }
    }

    private func errorView(error: CountriesViewModelError) -> some View {
        VStack(spacing: 8.0) {
            Image(systemName: "xmark.circle.fill")
                .foregroundStyle(.red)
            Text(error.localizedDescription)
            retryButton()
        }
    }

    private func retryButton() -> some View {
        Button("countries.navigation.retry") {
            Task {
                await countriesViewModel.fetchCountries()
            }
        }
    }
}

#Preview {
    CountriesView<CountriesViewModel>(countriesViewModel: CountriesViewModel())
}
