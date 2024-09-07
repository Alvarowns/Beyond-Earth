//
//  URL.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 6/9/24.
//

import Foundation

let nasaAPI = URL(string: "https://api.nasa.gov/")!
let nasaApiKey = "3Ikt4kFL5COnEdxAqnNetpcqqQpSBU446v6YwHAl"

let nasaAPODUrl = URL(string: "https://api.nasa.gov/planetary/apod")!
let nasaAsteroidsNeo = URL(string: "https://api.nasa.gov/neo/rest/v1/feed")!

let eonetEvents = URL(string: "https://eonet.gsfc.nasa.gov/api/v2.1/events")!

extension URL {
    static func getAPOD(apiKey: String = nasaApiKey) -> URL {
        let apiKeyQueryItem = URLQueryItem(name: "api_key", value: apiKey)
        
        return nasaAPODUrl.appending(queryItems: [apiKeyQueryItem])
    }
    
    static func getAsteroids(apiKey: String = nasaApiKey) -> URL {
        let apiKeyQueryItem = URLQueryItem(name: "api_key", value: apiKey)
        
        return nasaAsteroidsNeo.appending(queryItems: [apiKeyQueryItem])
    }
    
    static func getEonetEvents() -> URL {
        return eonetEvents
    }
}


