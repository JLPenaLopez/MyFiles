//
//  FileRepository.swift
//  TestSwitchNavigation
//
//  Created by Jorge Luis Peña López on 18/09/20.
//

import Foundation

protocol FileRepository {
    func getFiles(completion: @escaping (Result<[MyFile], Error>) -> Void)
}
