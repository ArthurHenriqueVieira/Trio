//
//  RestaurantMenuViewModel.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 23/08/21.
//

import Foundation

class RestaurantMenuViewModel {
    
    var delegate: ViewModelDataProtocol?
    var selectedSection = 0
    
    private var restaurant: Restaurant!
    
    var name: String? {
        return restaurant.name
    }
    
    var menuSections: [MenuSection]? {
        if let menus = restaurant.menus, menus.count > 0 {
            return menus[0].sections
        }
        return nil
    }
    
    init(withRestaurant restaurant: Restaurant) {
        self.restaurant = restaurant
    }
    
    func getDetails() {
        delegate?.viewModelWillStartUpdatingInfo()
        RestaurantApi.getRestaurantDetail(withId: restaurant.id!) { [self] response in
            delegate?.viewModelDidEndUpdatingInfo()
            restaurant = response
            delegate?.viewModelDidUpdateInfo()
        } failure: { [self] error in
            delegate?.viewModelDidEndUpdatingInfo()
        }
    }
    
    func getNumberOfItems() -> Int {
        return menuSections?[selectedSection].items?.count ?? 0
    }
    
    func getItem(withIndex index: Int) -> MenuItem {
        return (menuSections?[selectedSection].items?[index])!
    }
}
