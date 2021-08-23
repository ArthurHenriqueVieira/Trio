//
//  RestaurantListViewMode.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 22/08/21.
//

import Foundation

class RestaurantListViewModel {
    
    private var restaurantList = [Restaurant]()
    
    var delegate: ViewModelDataProtocol?
    
    func getAllRestaurants() {
        delegate?.viewModelWillStartUpdatingInfo()
        RestaurantApi.getRestaurants { [self] response in
            delegate?.viewModelDidEndUpdatingInfo()
            restaurantList = response
            delegate?.viewModelDidUpdateInfo()
        } failure: { [self] error in
            delegate?.viewModelDidEndUpdatingInfo()
        }
    }
    
    func getRestaurant(fromIndex index: Int) -> Restaurant {
        return restaurantList[index]
    }
    
    func getNumberOfRestaurants() -> Int {
        return restaurantList.count
    }
}
