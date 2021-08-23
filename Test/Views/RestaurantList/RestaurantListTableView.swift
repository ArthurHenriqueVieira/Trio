//
//  RestaurantListTableView.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 22/08/21.
//

import UIKit

protocol RestaurantListTableViewDataSource {
    func getRestaurant(fromIndex index: Int) -> Restaurant
    func getNumberOfRestaurants() -> Int
}

protocol RestaurantListTableViewDelegate {
    func didSelectRestaurant(fromIndex index: Int)
}

class RestaurantListTableView: UITableView {
    
    var restaurantListDataSource: RestaurantListTableViewDataSource?
    var restaurantListDelegate: RestaurantListTableViewDelegate?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        register(UINib(nibName: "RestaurantListTableViewCell", bundle: nil),
                 forCellReuseIdentifier: "cell")
        
        dataSource = self
        delegate = self
    }
}

extension RestaurantListTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantListDataSource?.getNumberOfRestaurants() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantListTableViewCell
        if let restaurant = restaurantListDataSource?.getRestaurant(fromIndex: indexPath.row) {
            cell.setData(restaurant)
        }
        return cell
    }
}

extension RestaurantListTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        restaurantListDelegate?.didSelectRestaurant(fromIndex: indexPath.row)
    }
}
