//
//  MenuItem.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 23/08/21.
//

import UIKit

class MenuItem: Codable {

    var name: String?
    var description: String?
    var pricing: [ItemPricing]?
    
    var priceString: String? {
        return pricing?[0].priceString
    }
}
