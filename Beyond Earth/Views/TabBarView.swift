//
//  TabBarView.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 7/9/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            NasaApodView()
                .tabItem {
                    VStack {
                        Image(systemName: "photo.fill")
                        Text("APOD")
                    }
                }
            
            NasaAsteroidsView()
                .tabItem {
                    VStack {
                        Image(systemName: "circle.slash")
                        Text("Asteroids")
                    }
                }
            
            EONETView()
                .tabItem {
                    VStack {
                        Image(systemName: "globe.europe.africa.fill")
                        Text("EONET")
                    }
                }
        }
    }
}

#Preview {
    TabBarView()
}
