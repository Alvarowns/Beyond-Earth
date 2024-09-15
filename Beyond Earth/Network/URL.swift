//
//  URL.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 6/9/24.
//

import Foundation

// No carga las imágenes porque la API no usa un servidor seguro https, en su lugar usa http y Apple no permite esto.
let mtgCards = URL(string: "https://api.magicthegathering.io/v1/cards")!

extension URL {
    static func getCardsByName(name: String, page: Int, pageSize: Int) -> URL {
        let nameQueryItem = URLQueryItem(name: "name", value: "\(name)")
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        let pageSizeQueryItem = URLQueryItem(name: "pageSize", value: "\(pageSize)")
        return mtgCards.appending(queryItems: [nameQueryItem, pageQueryItem, pageSizeQueryItem])
    }
    
    static func getCardsByCmc(cmc: Int, page: Int) -> URL {
        let cmcQueryItem = URLQueryItem(name: "cmc", value: "\(cmc)")
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        return mtgCards.appending(queryItems: [cmcQueryItem, pageQueryItem])
    }
    
    static func getCardsByFormat(format: String, page: Int) -> URL {
        let formatQueryItem = URLQueryItem(name: "format", value: "\(format)")
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        return mtgCards.appending(queryItems: [formatQueryItem, pageQueryItem])
    }
}


