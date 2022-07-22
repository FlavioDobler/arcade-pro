//
//  AppDelegate.swift
//  Bankey
//
//  Created by Flavio Dobler on 2022-07-20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = LoginViewController()
        window.makeKeyAndVisible()
        window.backgroundColor = .systemBackground
        self.window = window
        return true
    }

    


}

