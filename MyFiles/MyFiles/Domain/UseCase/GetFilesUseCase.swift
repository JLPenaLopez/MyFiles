//
//  GetFilesUseCase.swift
//  TestSwitchNavigation
//
//  Created by Jorge Luis Peña López on 18/09/20.
//

import Foundation

protocol GetFilesUseCase {
    func execute(completion: @escaping (Result<[MyFile], Error>) -> Void)
}

final class DefaultGetFilesUseCase: GetFilesUseCase {
    
    private let fileRepository: FileRepository
    
    init(fileRepository: FileRepository) {
        self.fileRepository = fileRepository
    }
    
    func execute(completion: @escaping (Result<[MyFile], Error>) -> Void) {
        fileRepository.getFiles(completion: completion)        
    }    
}
