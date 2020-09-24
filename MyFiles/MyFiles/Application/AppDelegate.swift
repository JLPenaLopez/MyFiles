//
//  AppDelegate.swift
//  TestSwitchNavigation
//
//  Created by Jorge Luis Peña López on 18/09/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appDIContainer = AppDIContainer()
    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        coordinator = AppCoordinator(window: window!, appDIContainer: appDIContainer,
                                     navigationController: navigationController)
        coordinator?.start()
        
        return true
    }

}

