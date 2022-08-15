//
//  Repository.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//

import Foundation
import Combine

protocol Repository {
    func getCurrencyList() -> AnyPublisher<[Currency], Error>
    func getPair(base: String, target: String, amount: String) -> AnyPublisher<Pair, Error>
}

// MARK: -
struct RemoteRepository: Repository {

    @Injected(\.service)
    private var service: Service

    func getCurrencyList() -> AnyPublisher<[Currency], Error> {
        return service.get(Config.EndPoint.code)
            .decode(type: CodeResponse.self, decoder: JSONDecoder())
            .map(\.currencyItems)
            .eraseToAnyPublisher()
    }

    func getPair(base: String, target: String, amount: String) -> AnyPublisher<Pair, Error> {
        return service.get(Config.EndPoint.pair(base: base, target: target, amount: amount))
            .decode(type: Pair.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

// MARK: -
struct MockRepository: Repository {

    private var items: [Currency] {
        return [
            Currency(code: "EUR", name: "Euro"),
            Currency(code: "GBP", name: "Pound"),
            Currency(code: "USD", name: "Dollar")
        ]
    }

    private var pair = Pair(base: "USD", target: "GBP", rate: 1.2, result: 150)

    func getCurrencyList() -> AnyPublisher<[Currency], Error> {
        return Future<[Currency], Error> { promise in
            promise(.success(items))
        }.eraseToAnyPublisher()
    }

    func getPair(base: String, target: String, amount: String) -> AnyPublisher<Pair, Error> {
        return Future<Pair, Error> { promise in
            promise(.success(pair))
        }.eraseToAnyPublisher()
    }
}

// MARK: - Injection
private struct RepositoryKey: InjectionKey {
    static var currentValue: Repository = RemoteRepository()
}

extension InjectedValues {
    var repository: Repository {
        get { Self[RepositoryKey.self] }
        set { Self[RepositoryKey.self] = newValue }
    }
}
