//
//  EONETModel.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 7/9/24.
//

import Foundation

struct EONETModel: Codable, Hashable {
    let title: String
    let description: String
    let link: String
    let events: [EONETEvent]
    
    struct EONETEvent: Codable, Hashable, Identifiable {
        let id: String
        let title: String
        let description: String
        let link: String
        let categories: [EONETEventCategory]
        let sources: [EONETEventSource]
        let geometries: [EONETEventGeometry]
        
        struct EONETEventCategory: Codable, Hashable, Identifiable {
            let id: Int
            let title: String
        }
        
        struct EONETEventSource: Codable, Hashable, Identifiable {
            let id: String
            let url: String
        }
        
        struct EONETEventGeometry: Codable, Hashable {
            let date: String
            let type: String
            let coordinates: [Double]
        }
    }
}
