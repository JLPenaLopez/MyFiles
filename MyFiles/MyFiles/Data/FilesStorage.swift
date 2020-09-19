//
//  Storage.swift
//  TestSwitchNavigation
//
//  Created by Jorge Luis Peña López on 18/09/20.
//

import Foundation

final class DefaultFilesStorage: FileRepository {
    
    init() {}
    
    func getFiles(completion: @escaping (Result<[MyFile], Error>) -> Void) {
        let files = self.generateFilesData()
        completion(.success(files))
    }
}

extension DefaultFilesStorage {
    private func generateFilesData() -> [MyFile] {
        let range = 1...30
        return range.map({
            return MyFile(fileName: "File \($0)", createDate: "2020-09-\($0)", isDownloaded: false)
        })
    }
}
