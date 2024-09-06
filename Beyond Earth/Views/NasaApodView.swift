//
//  ContentView.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 6/9/24.
//

import SwiftUI

struct NasaApodView: View {
    @EnvironmentObject private var viewModel: NasaVM
    
    var body: some View {
        let apod = viewModel.apod
        
        ScrollView {
            VStack {
                Text(apod.title)
                    .font(.title)
                    .bold()
                
                HStack {
                    Text("Date: \(apod.date)")
                    Spacer()
                    Text("Data from: NASA")
                }
                .foregroundStyle(.secondary)
                .padding([.top, .horizontal])
                .font(.caption)
                
                AsyncImage(url: URL(string: apod.hdurl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                
                VStack {
                    Text(apod.explanation)
                        .fontWeight(.semibold)
                }
                .padding()
            }
            
            Spacer()
        }
    }
}

#Preview {
    NasaApodView()
        .environmentObject(NasaVM())
}
