//
//  FileDetailsViewController.swift
//  MyFiles
//
//  Created by Jorge Luis Peña López on 23/09/20.
//

import UIKit

class FileDetailsViewController: UIViewController, Storyboarded {

    @IBOutlet weak var lblFileName: UILabel!
    @IBOutlet weak var lblCreateDate: UILabel!
    
    var viewModel: FilesDetailsViewModel!
    
    static func create(with viewModel: FilesDetailsViewModel) -> FileDetailsViewController {
        let view = FileDetailsViewController.instantiate()
        view.viewModel = viewModel
        return view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showFileDetails()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func showFileDetails() {
        lblFileName.text = viewModel.fileName
        lblCreateDate.text = viewModel.createDate
    }

}
