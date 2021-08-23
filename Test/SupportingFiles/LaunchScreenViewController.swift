//
//  LaunchScreenViewController.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 22/08/21.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let viewController = RestaurantListViewController(nibName: "RestaurantListViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}
