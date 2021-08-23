//
//  ViewModelDataProtocol.swift
//  Test
//
//  Created by Arthur Henrique de Oliveira on 22/08/21.
//

import Foundation

protocol ViewModelDataProtocol {
    func viewModelDidUpdateInfo()
    func viewModelWillStartUpdatingInfo()
    func viewModelDidEndUpdatingInfo()
}
