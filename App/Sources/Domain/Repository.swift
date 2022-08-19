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

    init() {
        cache.load()
    }

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
                .map { [weak self] item in
                    self?.cache[item.name] = CacheItem(created: Date(), pair: item)
                    self?.cache.save()
                    return item
                }
                .eraseToAnyPublisher()
        }

        return Future<Pair, Error> { promise in
            promise(.success(cacheItem.pair))
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
