//
//  RestaurantListViewController.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 22/08/21.
//

import UIKit

class RestaurantListViewController: ViewController {
    
    @IBOutlet weak var restaurantTableView: RestaurantListTableView!
    
    private let viewModel = RestaurantListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func getTitle() -> String {
        return "Restaurants"
    }
    
    private func setupView() {
        restaurantTableView.restaurantListDataSource = self
        restaurantTableView.restaurantListDelegate = self
        viewModel.delegate = self
        viewModel.getAllRestaurants()
    }
    
    private func updateView() {
        restaurantTableView.reloadData()
    }
    
    private func goToMenu(withRestaurant restaurant: Restaurant) {
        let vm = RestaurantMenuViewModel(withRestaurant: restaurant)
        let vc = RestaurantMenuViewController(nibName: "RestaurantMenuViewController", bundle: nil)
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension RestaurantListViewController: ViewModelDataProtocol {
    func viewModelWillStartUpdatingInfo() {
        startLoading()
    }
    
    func viewModelDidEndUpdatingInfo() {
        stopLoading()
    }
    
    func viewModelDidUpdateInfo() {
        updateView()
    }
}

extension RestaurantListViewController: RestaurantListTableViewDataSource {
    func getRestaurant(fromIndex index: Int) -> Restaurant {
        return viewModel.getRestaurant(fromIndex: index)
    }
    
    func getNumberOfRestaurants() -> Int {
        return viewModel.getNumberOfRestaurants()
    }
}

extension RestaurantListViewController: RestaurantListTableViewDelegate {
    func didSelectRestaurant(fromIndex index: Int) {
        goToMenu(withRestaurant: viewModel.getRestaurant(fromIndex: index))
    }
}
