//
//  AppDelegate.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let isRunningTests: Bool = ProcessInfo.processInfo.isRunningTests

    @Injected(\.navigation) var navigation

    // swiftlint:disable all
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()

        if !isRunningTests {
            navigation.pushViewController(CalculateModule.build(), animated: true)
        }

        return true
    }
    // swiftlint:enable all
}
