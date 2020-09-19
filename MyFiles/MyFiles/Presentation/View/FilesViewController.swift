//
//  FilesViewController.swift
//  TestSwitchNavigation
//
//  Created by Jorge Luis Peña López on 18/09/20.
//

import UIKit

class FilesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Storyboarded, AlertPresentable {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: FilesViewModel!
    
    static func create(with viewModel: FilesViewModel) -> FilesViewController {
        let view = FilesViewController.instantiate()
        view.viewModel = viewModel
        return view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getFiles()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        binding(to: viewModel)
    }
    
    private func binding(to viewModel: FilesViewModel) {
        viewModel.items.observe(on: self) { [weak self] _ in self?.tableView.reloadData() }
        viewModel.error.observe(on: self) { [weak self] in self?.showError($0) }
    }
    
    private func configView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .singleLine
    }
    
    private func showError(_ error: String) {
        guard !error.isEmpty else { return }
        showAlert(title: viewModel.errorTitle, message: error)        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FileTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? FileTableViewCell else {
            return UITableViewCell()
        };
        
        cell.setup(with: viewModel.items.value[indexPath.row])
        return cell
    }
}

