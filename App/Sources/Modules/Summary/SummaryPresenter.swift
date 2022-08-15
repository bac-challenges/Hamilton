//
//  SummaryPresenter.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import Foundation

final class SummaryPresenter: ObservableObject, PresenterInterface {

    // VIPER
    var router: SummaryRouterPresenterInterface!
    var interactor: SummaryInteractorPresenterInterface!
}

extension SummaryPresenter: SummaryPresenterRouterInterface {}
extension SummaryPresenter: SummaryPresenterInteractorInterface {}
extension SummaryPresenter: SummaryPresenterViewInterface {}
