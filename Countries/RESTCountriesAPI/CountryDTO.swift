//
//  CountryDTO.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import Foundation

struct CountryDTO: Codable {
    
    let name: Name?
    let capital: [String]?
    let population: Int?
    let continents: [String]?
    let flags: Flag?
    let translations: [String: Translation]
    
    struct Name: Codable {
        let common: String?
    }
    
    struct Translation: Codable {
        let official: String?
        let common: String?
    }

    struct Flag: Codable {
        let png: String?
    }
}
