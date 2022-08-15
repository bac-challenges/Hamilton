//
//  UIStoryboard+Utils.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//

import UIKit

extension UIStoryboard {
    func instantiateViewController<T>(ofType type: T.Type, withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: type)
        guard let viewController = instantiateViewController(withIdentifier: identifier) as? T else {
            preconditionFailure("Expected view controller with identifier \(identifier) to be of type \(type)")
        }
        return viewController
    }
}

// MARK: - Injection
private struct StoryboardKey: InjectionKey {
    static var currentValue: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
}

extension InjectedValues {
    var storyboard: UIStoryboard {
        get { Self[StoryboardKey.self] }
        set { Self[StoryboardKey.self] = newValue }
    }
}
