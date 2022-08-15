//
//  Config.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//

import UIKit

struct Config {
    @BundleBacked<String>(key: "api-url")
    static var url

    @BundleBacked<String>(key: "api-key")
    static var key

    @BundleBacked<String>(key: "api-refresh-interval")
    static var interval

    static var baseUrl: String {
        guard let url = url, let key = key else {
            fatalError()
        }
        return "https://\(url)\(key)"
    }
}
