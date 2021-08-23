//
//  ViewController.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 22/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = getTitle()
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "PlayfairDisplay-regular", size: 17)!]

        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    func startLoading() {
        DispatchQueue.main.async { [self] in
            indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            indicator.center = view.center
            view.addSubview(indicator)
            view.bringSubviewToFront(indicator)
            
            indicator.startAnimating()
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async { [self] in
            indicator.stopAnimating()
            indicator.removeFromSuperview()
        }
    }
    
    internal func getTitle() -> String {
        return ""
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if touch.view! is UIButton || touch.view! is UITextField {
            return false
        }
        return true
    }
}
