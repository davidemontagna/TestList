//
//  UserDetailViewController.swift
//  TestList
//
//  Created by Davide Montagna on 05/08/22.
//

import Foundation
import UIKit

class UserDetailViewController: UIViewController {
    
    // MARK: - Outlets
        
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Adapter
    
    lazy var adapter = UserDetailAdapter()
    
    // MARK: - ViewModel
    
    lazy var viewModel = UserDetailViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: UserDetailCell.self)
        tableView.register(cell: UserDetailHeaderCell.self)
        tableView.register(cell: UserDetailSeparatorCell.self)
        tableView.register(cell: UserDetailButtonsCell.self)
        adapter.uiitems = viewModel.uiitems
        // Setup TableView
        tableView.dataSource = adapter
        tableView.delegate = adapter
        // Setup viewModel
        viewModel.delegate = self
        // Setup adapter
        adapter.delegate = self
    }
}

// MARK: - Extensions

extension UserDetailViewController: UserDetailViewModelDelegate {
    func onSuccess(by useCase: UserDetailViewModelUseCases) {
        switch useCase {
        case .update:
            navigationController?.popViewController(animated: true)
        case .delete:
            break
        case .refresh:
            adapter.uiitems = viewModel.uiitems
            tableView.reloadData()
        }
    }
    
    func onFailure(error: String) {
        let alert = UIAlertController(title: "Si è verificato un errore",
                                      message: error,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .cancel,
                                      handler: { (action: UIAlertAction!) in
            
        }))
        present(alert, animated: true, completion: nil)
    }
}

extension UserDetailViewController: UserDetailAdapterDelegate {
    func dataDidChanged(value: String, type: UserDetailType) {
        viewModel.set(value: value, type: type)
    }
    
    func saveTapped() {
        viewModel.update()
    }
}
