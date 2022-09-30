//
//  AppDelegate.swift
//  SimpleNote
//
//  Created by faiz baraja on 30/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationRootVC = UINavigationController(rootViewController: ViewController())
        window.rootViewController = navigationRootVC // Your initial view controller.
        window.makeKeyAndVisible()
        self.window = window
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        return true
    }



}

