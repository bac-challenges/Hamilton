//
//  CalculateRouter.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit

final class CalculateRouter: RouterInterface {

    // VIPER
    weak var presenter: CalculatePresenterRouterInterface!
    weak var navigationController: UINavigationController?
}

extension CalculateRouter: CalculateRouterPresenterInterface {
    func next() {
        navigationController?.pushViewController(ConvertModule.build(), animated: true)
    }
}
