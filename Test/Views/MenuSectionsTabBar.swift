//
//  MenuSectionsTabBar.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 23/08/21.
//

import UIKit
import Material

@IBDesignable
class MenuSectionsTabBar: TabBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup() {
        dividerColor = Color.grey.lighten2
        dividerAlignment = .bottom
        lineColor = .black
        lineAlignment = .bottom
        backgroundColor = .white
    }
    
    func setData(_ data: [MenuSection]) {
        for section in data {
            addButton(withTitle: section.name!)
        }
    }
    
    private func addButton(withTitle title: String) {
        let item = TabItem(title: title, titleColor: .lightGray)
        item.selectedTitleColor = .black
        item.titleLabel?.font = UIFont(name: "Montserrat-regular", size: 13)
        
        
        tabItems.append(item)
    }
}
