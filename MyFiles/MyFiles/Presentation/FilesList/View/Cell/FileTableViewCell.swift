//
//  FileTableViewCell.swift
//  TestSwitchNavigation
//
//  Created by Jorge Luis Peña López on 18/09/20.
//

import UIKit

class FileTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFileName: UILabel!
    @IBOutlet weak var lblFileDate: UILabel!
    
    @IBOutlet weak var btnDownload: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    
    private var viewModel: FileItemViewModel!
    static let reuseIdentifier = String(describing: FileTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(with viewModel: FileItemViewModel) {
        self.viewModel = viewModel
        lblFileName.text = viewModel.fileName
        lblFileDate.text = viewModel.createDate
        btnShare.isHidden = !viewModel.isDownloaded
    }
    
    @IBAction func onBtnDownload(_ sender: Any) {
        viewModel.handleOnBtnDownload { (result) in
            DispatchQueue.main.async {
                if case let .success(data) = result {
                    self.btnShare.isHidden = !data
                }
            }
        }
    }
    
    @IBAction func onBtnShare(_ sender: Any) {
        viewModel.handleOnBtnShare { (result) in
            // Some code
        }
    }
    
}
