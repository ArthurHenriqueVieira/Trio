//
//  MenuSection.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 23/08/21.
//

import UIKit

class MenuSection: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name = "section_name"
        case description
        case items = "menu_items"
    }

    var name: String?
    var description: String?
    var items: [MenuItem]?
}
