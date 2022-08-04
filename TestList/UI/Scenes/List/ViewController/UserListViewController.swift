//
//  ViewController.swift
//  TestList
//
//  Created by Davide Montagna on 03/08/22.
//

import UIKit

class UserListViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Adapter
    
    lazy var adapter = UserListAdapter()
    
    // MARK: - ViewModel
    
    lazy var viewModel = UserListViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: UserListCell.self)
        adapter.uiitems = viewModel.uiitems
        // Setup TableView
        tableView.delegate = adapter
        tableView.dataSource = adapter
        // Setup viewModel
        viewModel.delegate = self
        // Fetching data
        viewModel.getUsers()
    }
}

// MARK: - Extensions

extension UserListViewController: UserListViewModelDelegate {
    func onSuccess(_ type: UserListViewModelUseCases, _ indexPath: IndexPath?) {
        switch type {
        case .getUsers:
            let users = viewModel.responseItems
            if(!users.isEmpty) {
                adapter.uiitems = viewModel.uiitems
                tableView.reloadData()
            }
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

