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

    @Injected(\.storyboard) var storyboard

    // swiftlint:disable all
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = CalculateModule.build()
        window?.makeKeyAndVisible()

        return true
    }
    // swiftlint:enable all
}
