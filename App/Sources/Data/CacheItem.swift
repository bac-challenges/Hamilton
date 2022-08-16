//
//  CacheItem.swift
//  Hamilton
//
//  Created by emile on 16/08/2022.
//

import Foundation

struct CacheItem: Codable, Equatable {
    let created: Date
    let pair: Pair

    var valid: Bool {
        guard let intervalString = Config.interval, let interval = Double(intervalString) else {
            return false
        }

        return created.addingTimeInterval(interval*3600) > Date()
    }
}
