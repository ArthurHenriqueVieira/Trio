//
//  RestaurantListTableViewCell.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 22/08/21.
//

import UIKit

class RestaurantListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    func setData(_ data: Restaurant) {
        nameLabel.text = data.name
        phoneLabel.text = data.phone
        websiteLabel.text = data.website
        priceLabel.text = data.priceRange
        addressLabel.text = data.address?.formatted
    }
}
