//
//  EONETView.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 7/9/24.
//

import SwiftUI
import MapKit

struct EONETView: View {
    @EnvironmentObject private var viewModel: EONETVM
    @StateObject private var publicFunctions = StaticFunctions()
    
    @State private var search: String = ""
    @State private var filtersSelectedNumber: Int = 0
    @State private var filterSelected: String?
    @State private var mapOrList: String = "Map"
    
    var menuPicker: [String] = ["Wildfire", "Storm", "Volcano", "Ice"]
    
    var filteredSearch: [EONETModel.EONETEvent] {
        let searchLowercased = search.lowercased()
        let filterSelectedLowercased = filterSelected?.lowercased() ?? ""
        
        if !search.isEmpty {
            if filterSelected == nil{
                return viewModel.events.events.filter { event in
                    event.title.lowercased().contains(searchLowercased)
                }
            } else {
                return viewModel.events.events.filter { event in
                    event.title.lowercased().contains(filterSelectedLowercased) && event.title.lowercased().contains(searchLowercased)
                }
            }
        } else {
            if filterSelected == nil {
                return viewModel.events.events
            } else {
                return viewModel.events.events.filter { event in
                    event.title.lowercased().contains(filterSelectedLowercased)
                }
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                if mapOrList == "List" {
                    ZStack {
                        List {
                            ForEach(filteredSearch, id: \.self) { event in
                                Text(event.title)
                            }
                        }
                        .disabled(viewModel.isLoading ? true : false)
                        
                        PopoverEONET()
                            .opacity(viewModel.isLoading ? 1.0 : 0.0)
                    }
                } else if mapOrList == "Map" {
                    ZStack {
                        Map {
                            ForEach(filteredSearch, id: \.self) { event in
                                let longitude = event.geometries.first?.coordinates.first ?? 0
                                let latitude = event.geometries.first?.coordinates.last ?? 0
                                var image: String {
                                    switch event.categories.first?.title {
                                    case "Wildfires": "flame.circle.fill"
                                    case "Volcanoes": "mountain.2.circle.fill"
                                    case "Sea and Lake Ice": "snowflake.circle.fill"
                                    case "Severe Storms": "cloud.bolt.rain.circle.fill"
                                    default: "mappin.circle.fill"
                                    }
                                }
                                
                                var color: Color {
                                    switch event.categories.first?.title {
                                    case "Wildfires": .pink
                                    case "Volcanoes": .brown
                                    case "Sea and Lake Ice": .cyan
                                    case "Severe Storms": .gray
                                    default: .green
                                    }
                                }
                                
                                Marker(event.title, systemImage: image, coordinate:  CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                                    .tint(color)
                            }
                        }
                        .mapStyle(.imagery())
                        .disabled(viewModel.isLoading ? true : false)
                        .onTapGesture {
                            publicFunctions.hideKeyboard()
                        }
                        
                        PopoverEONET()
                            .opacity(viewModel.isLoading ? 1.0 : 0.0)
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.getEonetEvents()
                }
            }
            .navigationTitle("Natural Events from EONET")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $search, prompt: "Search by city or natural event type")
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Filter", selection: $filterSelected) {
                            Text("All").tag(nil as String?)
                            ForEach(menuPicker, id: \.self) { option in
                                Text(option).tag(Optional(option))
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle.fill")
                            .foregroundStyle(.primary)
                            .font(.title2)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Picker("Map or List", selection: $mapOrList) {
                            Text("Map").tag("Map")
                            Text("List").tag("List")
                        }
                    } label: {
                        Image(systemName: "globe.europe.africa.fill")
                            .font(.title2)
                            .foregroundStyle(.mint)
                    }
                }
            }
        }
    }
}

#Preview {
    EONETView()
        .environmentObject(EONETVM())
}
