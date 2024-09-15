//
//  Beyond_EarthApp.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 6/9/24.
//

import SwiftUI

@main
struct Beyond_EarthApp: App {
    @StateObject private var nasaVM = NasaVM()
    @StateObject private var eonetVM = EONETVM()
    @StateObject private var solarSystemVM = SolarSystemVM()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
        .environmentObject(NasaVM())
        .environmentObject(EONETVM())
        .environmentObject(SolarSystemVM())
    }
}
