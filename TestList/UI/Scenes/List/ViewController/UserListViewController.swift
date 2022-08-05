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
        adapter.delegate = self
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
    func onSuccess(_ type: UserListViewModelUseCases) {
        switch type {
        case .getUsers:
            let users = viewModel.responseItems
            if(!users.isEmpty) {
                adapter.uiitems = viewModel.uiitems
                tableView.reloadData()
            }
        case .showDetail:
            if let index = viewModel.selectedItemIndex {
                let data = viewModel.responseItems[index]
                self.performSegue(withIdentifier: "user_detail_segue", sender: data)
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

extension UserListViewController: UserListAdapterDelegate {
    func onCellSelected(at index: Int) {
        viewModel.showDetail(for: index)
    }
}
