//
//  NasaVM.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 6/9/24.
//

import Foundation

@Observable
class NasaVM: ObservableObject {
    var network = Network()
    var errorMsg: String = ""
    var showAlert: Bool = false
    
    var apod: NasaAPOD = NasaAPOD(date: "", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "", url: "")
    var asteroids: NasaAsteroids = NasaAsteroids(links: NasaAsteroids.Links(next: "", previous: "", url: ""), elementCount: 0, nearEarthObjects: NasaAsteroids.NearEarthObjects(items: []))
    
    init() {
        Task {
            await getNasaAPOD()
            await getNasaAsteroids()
        }
    }
    
    func getNasaAPOD() async {
        do {
            let apod = try await network.getNasaAPOD()
            await MainActor.run {
                self.apod = apod
            }
        } catch {
            await MainActor.run {
                self.errorMsg = "\(error)"
                self.showAlert.toggle()
                print(errorMsg)
            }
        }
    }
    
    func getNasaAsteroids() async {
        do {
            let asteroids = try await network.getNasaAsteorids()
            await MainActor.run {
                self.asteroids = asteroids
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
