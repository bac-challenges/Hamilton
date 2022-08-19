//
//  Pair.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//

import Foundation

struct Pair: Codable, Equatable {

    enum CodingKeys: String, CodingKey {
        case base = "base_code"
        case target = "target_code"
        case rate = "conversion_rate"
    }

    let base: String
    let target: String
    let rate: Double

    var rateString: String {
        String(format: "%.2f", rate)
    }

    var name: String {
        "\(base)\(target)"
    }

    static func == (lhs: Pair, rhs: Pair) -> Bool {
        lhs.name == rhs.name
    }
}
