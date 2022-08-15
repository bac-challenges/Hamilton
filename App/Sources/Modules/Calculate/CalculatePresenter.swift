//
//  CalculatePresenter.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import Foundation

final class CalculatePresenter: ObservableObject, PresenterInterface {

    // VIPER
    var router: CalculateRouterPresenterInterface!
    var interactor: CalculateInteractorPresenterInterface!
}

extension CalculatePresenter: CalculatePresenterRouterInterface {}
extension CalculatePresenter: CalculatePresenterInteractorInterface {}
extension CalculatePresenter: CalculatePresenterViewInterface {}
