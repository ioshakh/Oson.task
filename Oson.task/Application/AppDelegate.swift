//
//  AppDelegate.swift
//  Oson.task
//
//  Created by Shakhzod Bektemirov on 2022/01/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0) , NSAttributedString.Key.foregroundColor:UIColor(hexString:"444444")]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UIBarButtonItem.appearance().tintColor = UIColor(hexString:"767676")
        
        setUp()
        return true
    }
    
    func setUp() {
        let cv = MainVc()
        let nv = UINavigationController(rootViewController:cv)
        self.window = UIWindow(frame:UIScreen.main.bounds)
        self.window?.rootViewController = nv
        self.window?.makeKeyAndVisible()
    }
}

