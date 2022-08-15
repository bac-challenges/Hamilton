//
//  ConvertRouter.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import UIKit

final class ConvertRouter: RouterInterface {
    weak var presenter: ConvertPresenterRouterInterface!
    weak var navigationController: UINavigationController?
}

extension ConvertRouter: ConvertRouterPresenterInterface {}
