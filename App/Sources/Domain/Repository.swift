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
final class RemoteRepository: Repository {

    @Injected(\.service)
    private var service: Service
    private var cache = [String: CacheItem]()

    func getCurrencyList() -> AnyPublisher<[Currency], Error> {
        return service.get(Config.EndPoint.code)
            .decode(type: CodeResponse.self, decoder: JSONDecoder())
            .map(\.currencyItems)
            .eraseToAnyPublisher()
    }

    func getPair(base: String, target: String, amount: String) -> AnyPublisher<Pair, Error> {

        guard let cacheItem = cache["\(base)\(target)"], cacheItem.valid else {
            return service.get(Config.EndPoint.pair(base: base, target: target))
                .decode(type: Pair.self, decoder: JSONDecoder())
                .map { item in
                    self.cache[item.name] = CacheItem(created: Date(), pair: item)
                    return item
                }
                .eraseToAnyPublisher()
        }

        return Future<Pair, Error> { promise in
            promise(.success(cacheItem.pair))
        }.eraseToAnyPublisher()
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

    private var pair = Pair(base: "USD", target: "GBP", rate: 1.2)

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
