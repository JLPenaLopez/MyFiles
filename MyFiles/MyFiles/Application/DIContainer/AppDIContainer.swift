//
//  AppDIContainer.swift
//  TestSwitchNavigation
//
//  Created by Jorge Luis Peña López on 18/09/20.
//

import Foundation

final class AppDIContainer {
    
    init() {}
    
    // MARK: - Repositories
    
    func getFileRepository() -> FileRepository {
        return DefaultFilesStorage()
    }
    
    // MARK: - Use Cases
    
    func getFilesUseCase() -> GetFilesUseCase {
        return DefaultGetFilesUseCase(fileRepository: getFileRepository())
    }
    
    // MARK: - View Models
    
    func getFilesViewModel(actions: FilesViewModelActions) -> FilesViewModel {
        return FilesViewModel(getFilesUseCase: getFilesUseCase(), actions: actions)
    }
    
    func getFileDetailsViewModel(myFile: MyFile) -> FilesDetailsViewModel {
        return FilesDetailsViewModel(myFile: myFile)
    }
}
