//
//  RestaurantMenuTableViewCell.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 23/08/21.
//

import UIKit

class RestaurantMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func setData(_ data: MenuItem) {
        nameLabel.text = data.name
        descriptionLabel.isHidden = data.description?.isEmpty ?? true
        descriptionLabel.text = data.description
        priceLabel.text = data.priceString
    }
}
