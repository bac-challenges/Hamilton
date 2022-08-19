//
//  Config.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//

import UIKit

struct Config {

    // swiftlint:disable all
    enum EndPoint: EndPointProtocol {

        case code
        case pair(base: String, target: String)
        case mock

        var url: URL? {
            switch self {
            case .code: return URL(string: "\(Config.baseUrl)codes")
            case .pair(let base, let target): return URL(string: "\(Config.baseUrl)pair/\(base)/\(target)")
            case .mock: return URL(fileURLWithPath: Bundle.main.path(forResource: "mock", ofType: "json") ?? "")
            }
        }
    }
    // swiftlint:enable all

    static var urlKey = "api-url"
    @BundleBacked<String>(key: urlKey)
    static var url

    @BundleBacked<String>(key: "api-key")
    static var key

    @BundleBacked<String>(key: "api-refresh-interval")
    static var interval
    static var timeInterval: TimeInterval {
        return 3600 * (Double(interval ?? "") ?? 0.0)
    }

    static var baseUrl: String {
        guard let url = url, let key = key else {
            fatalError()
        }
        return "https://\(url)\(key)"
    }
}
