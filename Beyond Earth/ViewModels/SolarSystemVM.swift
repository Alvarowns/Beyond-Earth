//
//  SolarSystemVM.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 8/9/24.
//

import Foundation

@Observable
class SolarSystemVM: ObservableObject {
    let network = Network()
    var errorMsg: String = ""
    var showAlert: Bool = false
    
    var bodies: SolarSystem = SolarSystem(bodies: [])
    let planets: [String] = ["mercury", "venus", "earth", "mars", "jupiter", "saturn", "uranus", "neptune"]
    
    init() {
        Task {
            await getSolarSystem()
        }
    }
    
    func getSolarSystem() async {
        do {
            let solarSystem = try await network.getSolarSystem()
            await MainActor.run {
                self.bodies = solarSystem
            }
        } catch {
            await MainActor.run {
                
                    self.errorMsg = "\(error)"
                    self.showAlert.toggle()
                    print(errorMsg)
            }
        }
    }
}
