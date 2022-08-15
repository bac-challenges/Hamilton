//
//  UINavigationController+Utils.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//

import UIKit

// MARK: - Injection
private struct NavigationKey: InjectionKey {
    static var currentValue = UINavigationController()
}

extension InjectedValues {
    var navigation: UINavigationController {
        get { Self[NavigationKey.self] }
        set { Self[NavigationKey.self] = newValue }
    }
}
