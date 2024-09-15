//
//  SolarSystem.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 8/9/24.
//

import Foundation

struct SolarSystem: Codable, Hashable {
    let bodies: [SolarSystemBody]
    
    struct SolarSystemBody: Codable, Hashable {
        let id: String
        let name: String
        let englishName: String
        let isPlanet: Bool
        let moons: [Moon]?
        let semimajorAxis: Int
        let perihelion: Int
        let aphelion: Int
        let eccentricity: Double
        let inclination: Double
        let mass: BodyMass?
        let vol: BodyVol?
        let density: Double
        let gravity: Double
        let escape: Double
        let meanRadius: Double
        let equaRadius: Double
        let polarRadius: Double
        let flattening: Double
        let dimension: String
        let sideralOrbit: Double
        let sideralRotation: Double
        let aroundPlanet: AroundPlanet?
        let discoveredBy: String
        let discoveryDate: String
        let alternativeName: String
        let axialTilt: Double
        let avgTemp: Int
        let mainAnomaly: Double
        let argPeriapsis: Double
        let longAscNode: Double
        let bodyType: String
        let rel: String
        
        struct Moon: Codable, Hashable {
            let moon: String
            let rel: String
        }
        
        struct BodyMass: Codable, Hashable {
            let massValue: Double
            let massExponent: Int
        }
        
        struct BodyVol: Codable, Hashable {
            let volValue: Double
            let volExponent: Int
        }
        
        struct AroundPlanet: Codable, Hashable {
            let planet: String
            let rel: String
        }
    }
}
