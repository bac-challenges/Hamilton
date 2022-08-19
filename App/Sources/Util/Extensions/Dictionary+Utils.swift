//
//  Dictionary+Utils.swift
//  Hamilton
//
//  Created by emile on 16/08/2022.
//

import Foundation

// MARK: - Clean stale items
extension Dictionary where Value == CacheItem {
    mutating func clean() {
        self = self.filter { $0.value.valid }
    }
}

// MARK: - Save cache to file
extension Dictionary where Key == String, Value == CacheItem {

    func save() {
        if let data = try? PropertyListEncoder().encode(self) {
            UserDefaults.standard.set(data, forKey: "hamilton-cache")
            print("Cache saved.")
        }
    }

    // swiftlint: disable all
    mutating func load() {
        guard let data = UserDefaults.standard.data(forKey: "hamilton-cache"),
              let dict = try? PropertyListDecoder().decode([String: CacheItem].self, from: data) else {
            return
        }

        print("Cache loaded.")
        self = dict
    }
    //swiftlint: enable all
}
