//
//  RestaurantResponse.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 22/08/21.
//

import UIKit

class RestaurantListResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case totalResults
        case page
        case totalPages = "total_pages"
        case morePages = "more_pages"
        case data
        case numResults
    }

    var totalResults: Int?
    var page: Int?
    var totalPages: Int?
    var morePages: Bool?
    var data: [Restaurant]?
    var numResults: Int?
}
