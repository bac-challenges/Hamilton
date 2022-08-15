//
//  ConvertRouter.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit

final class ConvertRouter: RouterInterface {

    // VIPER
    weak var presenter: ConvertPresenterRouterInterface!
    weak var navigationController: UINavigationController?
}

extension ConvertRouter: ConvertRouterPresenterInterface {
    func next(amount: String, code: String, rate: String) {
        let view = SummaryModule.build()
        view.amount = amount
        view.code = code
        view.rate = rate

        navigationController?.present(UINavigationController(rootViewController: view), animated: true)
    }

    func back() {
        navigationController?.popViewController(animated: true)
    }
}
