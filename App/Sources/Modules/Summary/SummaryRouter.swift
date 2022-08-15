//
//  SummaryRouter.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit

final class SummaryRouter: RouterInterface {
    weak var presenter: SummaryPresenterRouterInterface!
    weak var navigationController: UINavigationController?
}

extension SummaryRouter: SummaryRouterPresenterInterface {
    func done() {
        navigationController?.popToRootViewController(animated: false)
        navigationController?.dismiss(animated: true)
    }
}
