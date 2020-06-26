//
//  AppDelegate.swift
//  Estshara_Task
//
//  Created by Mohamed Gamal on 6/24/20.
//  Copyright © 2020 Me. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        startApplicationPoint()
        return true
    }
    
    private func startApplicationPoint(){
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = LoginContract.setup()
        self.window?.makeKeyAndVisible()
    }

}

