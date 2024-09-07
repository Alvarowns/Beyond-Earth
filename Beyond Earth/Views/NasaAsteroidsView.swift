//
//  NasaAsteroidsView.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 6/9/24.
//

import SwiftUI

struct NasaAsteroidsView: View {
    @EnvironmentObject private var viewModel: NasaVM
    
    var body: some View {
        List(viewModel.asteroids.nearEarthObjects.items, id: \.self) { item in
                VStack(alignment: .leading) {
                    Text("Closest Asteroids to Earth on \(item.closeApproachData.first?.date ?? "")")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    Divider()
                    
                    Text(item.name)
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        Text("Orbiting:")
                            .bold()
                        Spacer()
                        Text(item.closeApproachData.first?.orbitingBody ?? "")
                            .fontWeight(.semibold)
                            .foregroundStyle(item.closeApproachData.first?.orbitingBody == "Earth" ? .blue : .primary)
                    }
                    
                    HStack {
                        Text("Potentialy hazardous:")
                            .bold()
                        Spacer()
                        Text(item.hazardous ? "Yes" : "No")
                            .foregroundStyle(item.hazardous ? .red : .green)
                            .fontWeight(.semibold)
                    }
                    
                    HStack {
                        Text("Absolute magnitude: ")
                            .bold()
                        Spacer()
                        Text(item.absoluteMagnitude.description)
                            .fontWeight(.semibold)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Estimated diameter:")
                            .bold()
                        Text("min: \(String(format: "%.2f", item.estimatedDiameter.meters.min)) m")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .fontWeight(.semibold)
                        Text("max: \(String(format: "%.2f", item.estimatedDiameter.meters.max)) m")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .fontWeight(.semibold)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Close approach:")
                            .bold()
                        
                        Text("Date: \(item.closeApproachData.first?.dateFull ?? "")")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        Text("Velocity: \(String(format: "%.2f", Double(item.closeApproachData.first?.relativeVelocity.kmPerHour ?? "") ?? 0.0)) km/h")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .fontWeight(.semibold)
                        
                        Text("Miss distance: \(String(format: "%.2f", Double(item.closeApproachData.first?.missDistance.kilometers ?? "") ?? 0.0)) km")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .fontWeight(.semibold)
                    }
                }
        }
        .listStyle(.plain)
        .listRowSpacing(10)
    }
}

#Preview {
    NasaAsteroidsView()
        .environmentObject(NasaVM())
}
