//
//  CalculateInteractor.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//
//

import Combine

final class CalculateInteractor: InteractorInterface {

    // VIPER
    weak var presenter: CalculatePresenterInteractorInterface!

    //
    @Injected(\.repository) var repository
}

extension CalculateInteractor: CalculateInteractorPresenterInterface {
    func getCurrencyList() -> AnyPublisher<[Currency], Error> {
        repository.getCurrencyList().eraseToAnyPublisher()
    }

    func getPair(base: String, target: String, amount: Double) -> AnyPublisher<Pair, Error> {
        repository.getPair(base: base, target: target, amount: String(amount)).eraseToAnyPublisher()
    }
}
