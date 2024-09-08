//
//  NasaModel.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 6/9/24.
//

import Foundation

struct NasaAPOD: Codable {
    let date: String
    let explanation: String
    let hdurl: String
    let mediaType: String
    let serviceVersion: String
    let title: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl, title, url
        case mediaType = "media_type"
        case serviceVersion = "service_version"
    }
}

struct NasaAsteroids: Codable {
    let links: Links
    let elementCount: Int
    let nearEarthObjects: [String: [Asteroid]]
    
    struct Links: Codable {
        let next: String
        let previous: String
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case next, previous
            case url = "self"
        }
    }
    
    struct Asteroid: Codable, Hashable {
        let links: AsteroidLinks
        let id: String
        let neoReferenceId: String
        let name: String
        let nasaJplUrl: String
        let absoluteMagnitude: Double
        let estimatedDiameter: Diameter
        let hazardous: Bool
        let closeApproachData: [CloseApproach]
        let isSentryObject: Bool
        
        struct AsteroidLinks: Codable, Hashable {
            let url: String
            
            enum CodingKeys: String, CodingKey {
                case url = "self"
            }
        }
        
        struct Diameter: Codable, Hashable {
            let kilometers: EstimatedKilometers
            let meters: EstimatedMeters
            let miles: EstimatedMiles
            let feet: EstimatedFeet
            
            struct EstimatedKilometers: Codable, Hashable {
                let min: Double
                let max: Double
                
                enum CodingKeys: String, CodingKey {
                    case min = "estimated_diameter_min"
                    case max = "estimated_diameter_max"
                }
            }
            
            struct EstimatedMeters: Codable, Hashable {
                let min: Double
                let max: Double
                
                enum CodingKeys: String, CodingKey {
                    case min = "estimated_diameter_min"
                    case max = "estimated_diameter_max"
                }
            }
            
            struct EstimatedMiles: Codable, Hashable {
                let min: Double
                let max: Double
                
                enum CodingKeys: String, CodingKey {
                    case min = "estimated_diameter_min"
                    case max = "estimated_diameter_max"
                }
            }
            
            struct EstimatedFeet: Codable, Hashable {
                let min: Double
                let max: Double
                
                enum CodingKeys: String, CodingKey {
                    case min = "estimated_diameter_min"
                    case max = "estimated_diameter_max"
                }
            }
        }
        
        struct CloseApproach: Codable, Hashable {
            let date: String
            let dateFull: String
            let epochDate: Int
            let relativeVelocity: RelativeVelocity
            let missDistance: MissDistance
            let orbitingBody: String
            
            struct RelativeVelocity: Codable, Hashable {
                let kmPerSecond: String
                let kmPerHour: String
                let milesPerHour: String
                
                enum CodingKeys: String, CodingKey {
                    case kmPerSecond = "kilometers_per_second"
                    case kmPerHour = "kilometers_per_hour"
                    case milesPerHour = "miles_per_hour"
                }
            }
            
            struct MissDistance: Codable, Hashable {
                let astronomical: String
                let lunar: String
                let kilometers: String
                let miles: String
            }
            
            enum CodingKeys: String, CodingKey {
                case date = "close_approach_date"
                case dateFull = "close_approach_date_full"
                case epochDate = "epoch_date_close_approach"
                case relativeVelocity = "relative_velocity"
                case missDistance = "miss_distance"
                case orbitingBody = "orbiting_body"
            }
        }
        
        enum CodingKeys: String, CodingKey {
            case links, id, name
            case neoReferenceId = "neo_reference_id"
            case nasaJplUrl = "nasa_jpl_url"
            case absoluteMagnitude = "absolute_magnitude_h"
            case estimatedDiameter = "estimated_diameter"
            case hazardous = "is_potentially_hazardous_asteroid"
            case closeApproachData = "close_approach_data"
            case isSentryObject = "is_sentry_object"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case links
        case elementCount = "element_count"
        case nearEarthObjects = "near_earth_objects"
    }
}
