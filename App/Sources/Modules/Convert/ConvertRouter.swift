//
//  ConvertRouter.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit
import SwiftUI

final class ConvertRouter: RouterInterface {

    // VIPER
    weak var presenter: ConvertPresenterRouterInterface!
    weak var navigationController: UINavigationController?
}

extension ConvertRouter: ConvertRouterPresenterInterface {
    func next(amount: Double, code: String, rate: String) {
        var view = SummaryModule.build()
        view.amount = amount
        view.code = code
        view.rate = rate

        navigationController?.present(UIHostingController(rootView: view), animated: true)
    }

    func back() {
        navigationController?.popViewController(animated: true)
    }
}
