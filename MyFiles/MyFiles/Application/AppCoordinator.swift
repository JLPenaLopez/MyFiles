//
//  AppCoordinator.swift
//  TestSwitchNavigation
//
//  Created by Jorge Luis Peña López on 18/09/20.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private let appDIContainer: AppDIContainer
    let window: UIWindow
    
    init(window: UIWindow, appDIContainer: AppDIContainer) {
        self.window = window
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        
        let vc = FilesViewController.create(with: appDIContainer.getFilesViewModel())
        let navigationController: UINavigationController = UINavigationController(rootViewController: vc)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
    }
}
