//
//  Dictionary+Utils.swift
//  Hamilton
//
//  Created by emile on 16/08/2022.
//

import Foundation

// MARK: - Clean stale items
extension Dictionary where Value == CacheItem {
    mutating func cleanUp() {
        for item in self {
            // swiftlint: disable all
            if !item.value.valid {
                self.removeValue(forKey: item.key)
            }
            // swiftlint: enable all
        }
    }
}
