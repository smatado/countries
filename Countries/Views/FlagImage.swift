//
//  FlagView.swift
//  Countries
//
//  Created by Silbino Gonçalves Matado on 2025-03-12.
//

import SwiftUI

struct FlagImage: View {

    let url: URL?

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .empty:
                ProgressView()
                    .progressViewStyle(.circular)
            case .failure(_):
                placeholder()
            @unknown default:
                placeholder()
            }
        }
    }

    private func placeholder() -> some View {
        VStack {
            Image(systemName: "questionmark.circle")
            Text("countries.error.image")
        }
    }
}

