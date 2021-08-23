//
//  RestaurantApi.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 22/08/21.
//

import Foundation

class RestaurantApi: RestApi {
    
    private static var restaurantListPath = "restaurants/state/NY"
    private static var restaurantDetailPath = "restaurant/"
    
    static func getRestaurants(success: @escaping ([Restaurant]) -> Void,
                               failure: @escaping (String) -> Void) {
        
        callApi(requestURL: restaurantListPath,
                method: .get,
                parameters: nil) { (response: RestaurantListResponse?) in
            if let r = response?.data {
                success(r)
            } else {
                failure("Something went wrong!")
            }
        }
    }
    
    static func getRestaurantDetail(withId id: Int,
                                    success: @escaping (Restaurant) -> Void,
                                    failure: @escaping (String) -> Void) {
        
        callApi(requestURL: "\(restaurantDetailPath)\(id)",
                method: .get,
                parameters: nil) { (response: RestaurantResponse?) in
            if let r = response?.result {
                success(r)
            } else {
                failure("Something went wrong!")
            }
        }
    }
}
