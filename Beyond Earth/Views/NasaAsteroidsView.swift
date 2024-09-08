//
//  NasaAsteroidsView.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 6/9/24.
//

import SwiftUI

struct NasaAsteroidsView: View {
    @EnvironmentObject private var viewModel: NasaVM
    
    @State private var search: String = ""
    @State private var menuPressed: String = ""
    
    var body: some View {
        NavigationStack {
            List(viewModel.asteroids.nearEarthObjects.keys.sorted(), id: \.self) { date in
                Menu {
                    ForEach(viewModel.asteroids.nearEarthObjects[date] ?? [], id: \.self) { item in
                        VStack {
                            Text(item.name)
                        }
                    }
                } label: {
                    Text("Close approach on \(date)")
                        .font(.headline)
                }
                .foregroundStyle(.primary)
            }
            .listStyle(.automatic)
            .listRowSpacing(10)
        }
        .searchable(text: $search)
    }
}

#Preview {
    NasaAsteroidsView()
        .environmentObject(NasaVM())
}
