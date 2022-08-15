//
//  Bundle+Wrapper.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//

import Foundation

// swiftlint:disable all
@propertyWrapper struct BundleBacked<Value> {
    let key: String
    var wrappedValue: Value? {
        get { Bundle.main.object(forInfoDictionaryKey: key) as? Value }
    }
}
// swiftlint:enable all
