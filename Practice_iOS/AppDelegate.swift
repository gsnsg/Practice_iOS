//
//  AppDelegate.swift
//  Practice_iOS
//
//  Created by Sai Nikhit Gulla on 06/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = FoodOrderingViewController()
        
        return true
    }

}

