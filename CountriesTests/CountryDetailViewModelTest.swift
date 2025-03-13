//
//  CountryDetailViewModelTest.swift
//  CountriesTests
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import XCTest
@testable import Countries

final class CountryDetailViewModelTest: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testFields_Presence() throws {
        let mockedCountry = Country(name: "CountryA",
                                    flagURL: URL(string: "https://www.test.com/"),
                                    continents: ["ContinentA", "ContinentB"],
                                    population: 123456,
                                    capital: ["CapitalA", "CapitalB"])
        
        let sut = CountryDetailViewModel(country: mockedCountry)
        
        XCTAssertEqual(sut.name, mockedCountry.name)
        XCTAssertEqual(sut.flagURL, mockedCountry.flagURL)
        XCTAssertEqual(sut.formattedContinents, "ContinentA, ContinentB")
        XCTAssertEqual(sut.formattedPopulation, "123 456")
        XCTAssertEqual(sut.formattedCapital, "CapitalA, CapitalB")
    }
    
    func testFields_Absence() throws {
        let mockedCountry = Country(name: "CountryA",
                                    flagURL: nil,
                                    continents: nil,
                                    population: nil,
                                    capital: nil)
        
        let sut = CountryDetailViewModel(country: mockedCountry)
        
        XCTAssertEqual(sut.name, mockedCountry.name)
        XCTAssertEqual(sut.flagURL, mockedCountry.flagURL)
        XCTAssertEqual(sut.formattedContinents, NSLocalizedString("countries.detail.notAvailable", comment: ""))
        XCTAssertEqual(sut.formattedPopulation, NSLocalizedString("countries.detail.notAvailable", comment: ""))
        XCTAssertEqual(sut.formattedPopulation, NSLocalizedString("countries.detail.notAvailable", comment: ""))
    }
}

