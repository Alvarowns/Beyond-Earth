//
//  Network.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 6/9/24.
//

import SwiftUI

protocol DataInteractor {
    func getNasaAPOD() async throws -> NasaAPOD
}

struct Network: DataInteractor {
    
    func getJSON<JSON>(request: URLRequest, type: JSON.Type) async throws -> JSON where JSON: Codable {
        let (data, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode == 200 {
            do {
                return try JSONDecoder().decode(type, from: data)
            } catch {
                throw NetworkError.json(error)
            }
        } else {
            throw NetworkError.status(response.statusCode)
        }
    }
    
    func postJSON(request: URLRequest, status: Int = 200) async throws {
        let (_, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode != status {
            throw NetworkError.status(response.statusCode)
        }
    }
    
    func getNasaAPOD() async throws -> NasaAPOD {
        try await getJSON(request: .get(url: .getAPOD()), type: NasaAPOD.self)
    }
    
//    func getNasaAsteorids() async throws -> NasaAsteroids {
//        try await getJSON(request: .get(url: .getAsteroids()), type: NasaAsteroids.self)
//    }
    
    func getEonetEvents() async throws -> EONETModel {
        try await getJSON(request: .get(url: .getEonetEvents()), type: EONETModel.self)
    }
    
//    func getSolarSystem() async throws -> SolarSystem {
//        try await getJSON(request: .get(url: .getSolarSystem()), type: SolarSystem.self)
//    }
}
