//
//  Pair.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//

import Foundation

struct Pair: Codable {

    enum CodingKeys: String, CodingKey {
        case base = "base_code"
        case target = "target_code"
        case rate = "conversion_rate"
        case result = "conversion_result"
    }

    let base: String
    let target: String
    let rate: Double
    let result: Double

    var rateString: String {
        String(format: "%.2f", rate)
    }

    var resultString: String {
        String(format: "%.2f", result)
    }
}
