//
//  CodeResponse.swift
//  Hamilton
//
//  Created by emile on 13/08/2022.
//

import Foundation

struct CodeResponse: Codable {

    enum CodingKeys: String, CodingKey {
        case supportedCodes = "supported_codes"
    }

    let supportedCodes: [[String]]

    var currencyItems: [Currency] {
        supportedCodes.map { item in
            Currency(code: item[0], name: item[1])
        }
    }
}
