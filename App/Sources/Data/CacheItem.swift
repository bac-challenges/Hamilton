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
        return created.addingTimeInterval(Config.timeInterval) > Date()
    }
}
