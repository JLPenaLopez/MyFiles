//
//  FileDetailsViewModel.swift
//  MyFiles
//
//  Created by Jorge Luis Peña López on 23/09/20.
//

import Foundation

protocol FilesDetailsViewModelOutput {
    var fileName: String { get }
    var createDate: String { get }
}

final class FilesDetailsViewModel: FilesDetailsViewModelOutput {
    
    var fileName: String
    var createDate: String
    
    init(myFile: MyFile) {
        self.fileName = myFile.fileName
        self.createDate = myFile.createDate
    }
    
}
