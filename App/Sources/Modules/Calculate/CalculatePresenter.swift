//
//  CalculatePresenter.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import Foundation
import Combine

final class CalculatePresenter: ObservableObject, PresenterInterface {

    enum CurrencyTarget {
        case base, target
    }

    // VIPER
    var router: CalculateRouterPresenterInterface!
    var interactor: CalculateInteractorPresenterInterface!

    //
    @Published var items = [Currency]()
    @Published var baseCurrencyCode = ~"NOT_SELECTED"
    @Published var targetCurrencyCode = ~"NOT_SELECTED"

    var amount = 0.0
    var target: CurrencyTarget = .base

    //
    private var cancelBag = CancelBag()
}

extension CalculatePresenter: CalculatePresenterRouterInterface {}
extension CalculatePresenter: CalculatePresenterInteractorInterface {}
extension CalculatePresenter: CalculatePresenterViewInterface {

    var itemsPublisher: Published<[Currency]>.Publisher { $items }
    var baseCurrencyCodePublisher: Published<String>.Publisher { $baseCurrencyCode }
    var targetCurrencyCodePublisher: Published<String>.Publisher { $targetCurrencyCode }

    var isTextFieldAvaliable: Bool {
        baseCurrencyCode != ~"NOT_SELECTED" && targetCurrencyCode != ~"NOT_SELECTED"
    }

    func getCurrencyList() {
        interactor.getCurrencyList()
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: { [weak self] items in
                self?.items = items
            }
            .store(in: cancelBag)
    }

    func setCurrency(_ code: String) {
        switch target {
        case .base: baseCurrencyCode = code
        case .target: targetCurrencyCode = code
        }
    }

    func next() {
        interactor.getPair(base: baseCurrencyCode, target: targetCurrencyCode, amount: amount)
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: { [weak self] pair in
                self?.router.next(pair: pair, amount: 1)
            }
            .store(in: cancelBag)
    }
}
