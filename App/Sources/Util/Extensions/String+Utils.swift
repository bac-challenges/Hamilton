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

// MARK: - CurrencyInputFormatting
extension String {
    func currencyInputFormatting() -> String {

        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = ""
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2

        var amountWithPrefix = self

        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix,
                                                          options: NSRegularExpression.MatchingOptions(rawValue: 0),
                                                          range: NSRange(location: 0, length: self.count),
                                                          withTemplate: "")

        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))

        guard number != 0 as NSNumber else {
            return ""
        }

        return formatter.string(from: number)!
    }
}
// swiftlint:enable all
