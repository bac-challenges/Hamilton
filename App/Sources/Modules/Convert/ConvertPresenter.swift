//
//  ConvertPresenter.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import Foundation

final class ConvertPresenter: ObservableObject, PresenterInterface {

    // VIPER
    var router: ConvertRouterPresenterInterface!
    var interactor: ConvertInteractorPresenterInterface!
}

extension ConvertPresenter: ConvertPresenterRouterInterface {}
extension ConvertPresenter: ConvertPresenterInteractorInterface {}
extension ConvertPresenter: ConvertPresenterViewInterface {
    func next() {
        router.next()
    }
}
