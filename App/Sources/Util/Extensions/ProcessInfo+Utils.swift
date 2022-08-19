//
//  ProcessInfo+Utils.swift
//  Hamilton
//
//  Created by emile on 19/08/2022.
//

import Foundation

extension ProcessInfo {
    public var isRunningTests: Bool {
        environment["XCTestConfigurationFilePath"] != nil
    }
}
