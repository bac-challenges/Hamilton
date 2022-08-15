//
//  String+Utils.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//

import Foundation

// MARK: - Localization
public extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}

// swiftlint:disable all
prefix operator ~
prefix public func ~(string: String) -> String {
    return NSLocalizedString(string, comment: "")
}
// swiftlint:enable all
