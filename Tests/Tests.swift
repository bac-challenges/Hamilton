//
//  Tests.swift
//  Tests
//
//  Created by emile on 18/08/2022.
//

import XCTest
@testable import Hamilton

final class Tests: XCTestCase {

    private var pair: Pair!
    private var validItem: CacheItem!
    private var invalidIem: CacheItem!
    private var cacheDict: [String: CacheItem]!

    override func setUp() {
        super.setUp()

        pair = Pair(base: "USD", target: "GBP", rate: 0.8)
        validItem = CacheItem(created: Date(), pair: pair)
        invalidIem = CacheItem(created: Date().addingTimeInterval(-Config.timeInterval), pair: pair)
        cacheDict = ["valid": validItem, "invalid": invalidIem]
    }

    func testCacheItemValid() throws {
        XCTAssertTrue(validItem.valid)
        XCTAssertFalse(invalidIem.valid)
    }

    func testDictClean() throws {
        cacheDict.clean()
        XCTAssertTrue(cacheDict.count == 1)
    }

    func testSaveLoadCache() {

        var cache = [String: CacheItem]()

        XCTAssertNotEqual(cache, cacheDict)
        cache = cacheDict
        cache.save()
        XCTAssertEqual(cache, cacheDict)
        cache = [String: CacheItem]()
        cache.save()
        XCTAssertNotEqual(cache, cacheDict)
    }
}
