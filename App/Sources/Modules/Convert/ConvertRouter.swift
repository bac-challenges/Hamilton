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

    func next() {
        let summary = UINavigationController(rootViewController: SummaryModule.build())
        navigationController?.present(summary, animated: true)
    }

    func back() {
        navigationController?.popViewController(animated: true)
    }
}
