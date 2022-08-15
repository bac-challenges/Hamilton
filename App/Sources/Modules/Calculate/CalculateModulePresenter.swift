//
//  CalculateModulePresenter.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//  
//

import SwiftUI

final class CalculateModulePresenter: PresenterInterface {
    var router: CalculateModuleRouterPresenterInterface!
    var interactor: CalculateModuleInteractorPresenterInterface!

    weak var viewModel: CalculateModuleViewModel!
}

extension CalculateModulePresenter: CalculateModulePresenterRouterInterface {}

extension CalculateModulePresenter: CalculateModulePresenterInteractorInterface {}

extension CalculateModulePresenter: CalculateModulePresenterViewInterface {}
