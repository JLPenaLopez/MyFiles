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
    private weak var navigationController: UINavigationController?
    let window: UIWindow
    
    init(window: UIWindow, appDIContainer: AppDIContainer, navigationController: UINavigationController?) {
        self.window = window
        self.appDIContainer = appDIContainer
        self.navigationController = navigationController
    }
    
    func start() {
        let actions = FilesViewModelActions(showFileDetails: showFileDetails)
        
        let vc = FilesViewController.create(with: appDIContainer.getFilesViewModel(actions: actions))
        navigationController?.pushViewController(vc, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
    }
    
    func showFileDetails(myFile: MyFile) {
        let vc = FileDetailsViewController.create(with: appDIContainer.getFileDetailsViewModel(myFile: myFile))
        navigationController?.present(vc, animated: true, completion: nil)
    }
}
