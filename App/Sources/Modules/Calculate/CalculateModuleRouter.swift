//
//  CalculateModuleRouter.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//  
//

import Foundation

final class CalculateModuleRouter: RouterInterface {
    weak var presenter: CalculateModulePresenterRouterInterface!
}

extension CalculateModuleRouter: CalculateModuleRouterPresenterInterface {}
