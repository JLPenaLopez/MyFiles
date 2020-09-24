//
//  FileItemViewModel.swift
//  TestSwitchNavigation
//
//  Created by Jorge Luis Peña López on 18/09/20.
//

import Foundation

final class FileItemViewModel {
    
    let fileName: String
    let createDate: String
    var isDownloaded: Bool
    
    init(myFile: MyFile) {
        self.fileName = myFile.fileName
        self.createDate = myFile.createDate
        self.isDownloaded = myFile.isDownloaded
    }
    
    func handleOnBtnDownload(completion: @escaping (Result<Bool, Error>) -> Void) {
        // Add code for download file and after if is success
        isDownloaded = true
        print("State success when file \(fileName) is download")
        completion(.success(isDownloaded))
    }
    
    func handleOnBtnShare(completion: @escaping (Result<Bool, Error>) -> Void) {
        // Add code for share file and after if is success
        print("State success when file \(fileName) is shared")
        completion(.success(true))
    }
}
