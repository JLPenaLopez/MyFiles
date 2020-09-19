//
//  FilesViewModel.swift
//  TestSwitchNavigation
//
//  Created by Jorge Luis Peña López on 18/09/20.
//

import Foundation

protocol FilesViewModelOutput {
    var items: Observable<[FileItemViewModel]> { get }
    var error: Observable<String> { get }
}

final class FilesViewModel: FilesViewModelOutput {
    
    private let getFilesUseCase: GetFilesUseCase
    
    var items: Observable<[FileItemViewModel]> = Observable([])
    var error: Observable<String> = Observable("")
    
    let errorTitle = "Some title error"
    
    init(getFilesUseCase: GetFilesUseCase) {
        self.getFilesUseCase = getFilesUseCase
    }
    
    func getFiles() {
        
        getFilesUseCase.execute { (result) in
            switch result {
            case .success(let myFiles):
                self.items.value = myFiles.map { $0 }.map(FileItemViewModel.init)                
            case .failure(let error):
                self.handleError(error: error)
            }
        }
    }
    
    private func handleError(error: Error) {
        self.error.value = "Handle and set message of some error"
    }
}
