//
//  Test.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 8/9/24.
//

import Foundation

extension SolarSystem.SolarSystemBody {
    static let test: SolarSystem.SolarSystemBody = SolarSystem.SolarSystemBody(id: "1", name: "tierra", englishName: "earth", isPlanet: true, moons: [Moon(moon: "Moon", rel: "https://api.le-systeme-solaire.net/rest/bodies/lune")], semimajorAxis: 149598023, perihelion: 147095000, aphelion: 152100000, eccentricity: 0.01670, inclination: 0.00000, mass: BodyMass(massValue: 5.97237, massExponent: 24), vol: BodyVol(volValue: 1.08321, volExponent: 12), density: 5.51360, gravity: 9.80000, escape: 11190.00000, meanRadius: 6371.00840, equaRadius: 6378.13660, polarRadius: 6356.80000, flattening: 0.00335, dimension: "", sideralOrbit: 365.25600, sideralRotation: 23.93450, aroundPlanet: nil, discoveredBy: "", discoveryDate: "", alternativeName: "", axialTilt: 23.4393, avgTemp: 288, mainAnomaly: 358.61700, argPeriapsis: 85.90100, longAscNode: 18.27200, bodyType: "Planet", rel: "https://api.le-systeme-solaire.net/rest/bodies/terre")
}
