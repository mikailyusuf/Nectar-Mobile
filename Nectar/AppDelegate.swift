//
//  AppDelegate.swift
//  Nectar
//
//  Created by Mikail on 16/07/2022.
//

import UIKit
 @main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        var vc:UIViewController
        if(ApiManager.shared.accessToken == ""){
         vc = UINavigationController(rootViewController:LoginViewController())
        }else{
            vc = HomeViewController()
        }
        window?.rootViewController = vc
        return true
    }
    
}


