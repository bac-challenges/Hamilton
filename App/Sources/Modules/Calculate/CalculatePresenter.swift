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

    // VIPER
    var router: CalculateRouterPresenterInterface!
    var interactor: CalculateInteractorPresenterInterface!

    //
    @Published var items = [Currency]()

    //
    private var cancelBag = CancelBag()
}

extension CalculatePresenter: CalculatePresenterRouterInterface {}
extension CalculatePresenter: CalculatePresenterInteractorInterface {}
extension CalculatePresenter: CalculatePresenterViewInterface {

    var itemsPublisher: Published<[Currency]>.Publisher { $items }

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

    func next() {
        interactor.getPair(base: "USD", target: "AED", amount: 1)
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: { [weak self] pair in
                self?.router.next(pair: pair, amount: 1)
            }
            .store(in: cancelBag)
    }
}
