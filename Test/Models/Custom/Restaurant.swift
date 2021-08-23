//
//  Restaurant.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 22/08/21.
//

import UIKit

class Restaurant: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id = "restaurant_id"
        case name = "restaurant_name"
        case phone = "restaurant_phone"
        case website = "restaurant_website"
        case hours
        case priceRange = "price_range"
        case menus
        case address
    }
    
    var id: Int?
    var name: String?
    var phone: String?
    var website: String?
    var hours: String?
    var priceRange: String?
    var menus: [Menu]?
    var address: Address?
}
