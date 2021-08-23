//
//  Menu.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 23/08/21.
//

import UIKit

class Menu: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name = "menu_name"
        case sections = "menu_sections"
    }
    
    var name: String?
    var sections: [MenuSection]?
}
