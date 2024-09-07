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
    
    @State private var search: String = ""
    @State private var filtersSelectedNumber: Int = 0
    @State private var filterSelected: String?
    @State private var mapOrList: String = "Map"
    @State private var longLoading: Bool = false
    @State private var wildfireLongLoading: Bool = false
    
    var menuPicker: [String] = ["Wildfire", "Storm", "Volcano", "Ice"]
    
    var filteredSearch: [EONETModel.EONETEvent] {
        if !search.isEmpty {
            if filterSelected == nil{
                return viewModel.events.events.filter { event in
                    event.title.lowercased().contains(search.lowercased())
                }
            } else {
                return viewModel.events.events.filter { event in
                    event.title.lowercased().contains(filterSelected?.lowercased() ?? "") && event.title.lowercased().contains(search.lowercased())
                }
            }
        } else {
            if filterSelected == nil {
                return viewModel.events.events
            } else {
                return viewModel.events.events.filter { event in
                    event.title.lowercased().contains(filterSelected?.lowercased() ?? "")
                }
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                if mapOrList == "List" {
                    List {
                        ForEach(filteredSearch, id: \.self) { event in
                            Text(event.title)
                        }
                    }
                } else if mapOrList == "Map" {
                    Map {
                        ForEach(filteredSearch, id: \.self) { event in
                            let longitude = event.geometries.first?.coordinates.first
                            let latitude = event.geometries.first?.coordinates.last
                            
                            let type = event.categories.first?.title
                            
                            Marker(event.title, coordinate: CLLocationCoordinate2D(latitude: latitude ?? 0, longitude: longitude ?? 0))
                        }
                    }
                }
            }
            .onAppear {
                longLoading.toggle()
            }
            .alert("Depending on the number of events this page may take longer than expected to load",
                   isPresented: $longLoading,
                   actions: {
                Button("Ok") {
                    longLoading.toggle()
                }
            },
                   message: {
                Text(
                    "In a few seconds you will see every marker!"
                )
            })
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
