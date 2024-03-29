//
//  AppDelegate.swift
//  TipJar
//
//  Created by kukuh on 07/04/22.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift
import RealmSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        setupNavigationBar()
        setupKeyboard()
        setupRealm()
        return true
    }

    private func setupNavigationBar() {
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().shadowImage = UIImage()
    }

    private func setupKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldShowToolbarPlaceholder = false
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysHide
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }

    private func setupRealm() {
        let config = Realm.Configuration(
            schemaVersion: 2
        )
        Realm.Configuration.defaultConfiguration = config
    }
}
