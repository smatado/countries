//
//  CountriesTests.swift
//  CountriesTests
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import Testing
@testable import Countries

class CountriesViewModelTests {

    private var sut: CountriesViewModel!
    private var mockCountriesService: CountriesServiceMock!

    @MainActor
    init() {
        mockCountriesService = CountriesServiceMock()
        sut = CountriesViewModel(countriesService: mockCountriesService)
    }

    deinit {
        sut = nil
        mockCountriesService = nil
    }

    @Test("Fetch Countries succes in expected order")
    func testFetchCountries_Success() async throws {
        // Arrange
        mockCountriesService.mockResult = .success(mockedCountriesInRandomOrder)

        // Act
        await sut.fetchCountries()

        // Assert
        if case .success(let countryItemViewModels) = await sut.state {
            let countryNamesExpectedOrder = [
                "Country A",
                "Country B",
                "Country C"
            ]
            #expect(countryItemViewModels.map { $0.countryName } == countryNamesExpectedOrder)
        }
    }

    @Test("Fetch Countries failure")
    func testFetchCountries_Failure() async throws {
        // Arrange
        mockCountriesService.mockResult = .failure(ErrorMock.default)

        // Act
        await sut.fetchCountries()

        // Assert
        if case .error(let error) = await sut.state {
            #expect(error == .fetchingCountries)
        }
    }
}
