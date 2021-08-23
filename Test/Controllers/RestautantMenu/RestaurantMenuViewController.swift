//
//  RestaurantMenuViewController.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 23/08/21.
//

import UIKit
import Material

class RestaurantMenuViewController: ViewController {

    @IBOutlet weak var tableView: RestaurantMenuTableView!
    @IBOutlet weak var tabBar: MenuSectionsTabBar!
    
    var viewModel: RestaurantMenuViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func getTitle() -> String {
        return viewModel.name!
    }
    
    private func setupView() {
        tabBar.delegate = self
        tableView.restaurantMenuDataSource = self
        viewModel.delegate = self
        viewModel.getDetails()
    }
    
    private func updateView() {
        if let menuSections = viewModel.menuSections {
            tabBar.setData(menuSections)
        }
        tableView.reloadData()
    }
}

extension RestaurantMenuViewController: ViewModelDataProtocol {
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

extension RestaurantMenuViewController: RestaurantMenuTableViewDataSource {
    func getItem(fromIndex index: Int) -> MenuItem {
        return viewModel.getItem(withIndex: index)
    }
    
    func getNumberOfItems() -> Int {
        return viewModel.getNumberOfItems()
    }
}

extension RestaurantMenuViewController: TabBarDelegate {
    
    func tabBar(tabBar: TabBar, willSelect tabItem: TabItem) {
        
        if let index = tabBar.tabItems.firstIndex(where: {
            $0.title == tabItem.title
        }) {
            viewModel.selectedSection = index
            tableView.reloadData()
        }
    }
}
