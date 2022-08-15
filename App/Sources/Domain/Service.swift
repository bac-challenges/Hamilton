//
//  Service.swift
//  Hamilton
//
//  Created by emile on 12/08/2022.
//

import Foundation
import Combine

// MARK: - EndPoint
protocol EndPointProtocol {
    var url: URL? { get }
}

// MARK: - Service
protocol Service {
    func get(_ endpoint: EndPointProtocol) -> AnyPublisher<Data, Error>
}

struct RemoteService: Service {
    func get(_ endpoint: EndPointProtocol) -> AnyPublisher<Data, Error> {

        guard let url = endpoint.url else { fatalError("BAD URL") }

        return URLSession.shared.dataTaskPublisher(for: url, cachedResponseOnError: true)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}

struct LocalService: Service {
    func get(_ endpoint: EndPointProtocol) -> AnyPublisher<Data, Error> {

        guard let url = endpoint.url else { fatalError("BAD URL")}

        guard let data = try? Data(contentsOf: url) else {
            fatalError("BAD DATA")
        }

        return Future<Data, Error> { promise in
            promise(.success(data))
        }.eraseToAnyPublisher()
    }
}

// MARK: - Injection
private struct ServiceKey: InjectionKey {
    static var currentValue: Service = RemoteService()
}

extension InjectedValues {
    var service: Service {
        get { Self[ServiceKey.self] }
        set { Self[ServiceKey.self] = newValue }
    }
}
