//
//  RestaurantMenuTableView.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 23/08/21.
//

import UIKit

protocol RestaurantMenuTableViewDataSource {
    func getItem(fromIndex index: Int) -> MenuItem
    func getNumberOfItems() -> Int
}

class RestaurantMenuTableView: UITableView {

    var restaurantMenuDataSource: RestaurantMenuTableViewDataSource?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        register(UINib(nibName: "RestaurantMenuTableViewCell", bundle: nil),
                 forCellReuseIdentifier: "cell")
        
        dataSource = self
        delegate = self
    }
}

extension RestaurantMenuTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantMenuDataSource?.getNumberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantMenuTableViewCell
        if let item = restaurantMenuDataSource?.getItem(fromIndex: indexPath.row) {
            cell.setData(item)
        }
        return cell
    }
}

extension RestaurantMenuTableView: UITableViewDelegate {
}
