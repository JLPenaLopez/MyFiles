//
//  FilesViewModel.swift
//  TestSwitchNavigation
//
//  Created by Jorge Luis Peña López on 18/09/20.
//

import Foundation

struct FilesViewModelActions {
    let showFileDetails: (MyFile) -> Void
}

protocol FilesViewModelInput {
    func didSelectItem(at index: Int)
}

protocol FilesViewModelOutput {
    var items: Observable<[FileItemViewModel]> { get }
    var error: Observable<String> { get }
}

final class FilesViewModel: FilesViewModelInput, FilesViewModelOutput {
    
    private let getFilesUseCase: GetFilesUseCase
    private let actions: FilesViewModelActions?
    
    var items: Observable<[FileItemViewModel]> = Observable([])
    var error: Observable<String> = Observable("")
    
    let errorTitle = "Some title error"
    
    init(getFilesUseCase: GetFilesUseCase, actions: FilesViewModelActions? = nil) {
        self.getFilesUseCase = getFilesUseCase
        self.actions = actions
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
    
    func didSelectItem(at index: Int) {
        let item: FileItemViewModel = items.value[index];
        actions?.showFileDetails(MyFile(fileName: item.fileName,
                                        createDate: item.createDate,
                                        isDownloaded: item.isDownloaded))
    }
}
