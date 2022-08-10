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
    
    lazy var adapter = UserListAdapter(delegate: self)
    
    // MARK: - ViewModel
    
    lazy var viewModel = UserListViewModel(delegate: self)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: UserListCell.self)
        adapter.uiitems = viewModel.uiitems
        // Setup TableView
        tableView.delegate = adapter
        tableView.dataSource = adapter
        // Fetching data
        viewModel.getUsers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let user = sender as? User, let destination = segue.destination as? UserDetailViewController {
            destination.viewModel.detailItem = user
            destination.delegate = self
        }
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
        case .updateUser:
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

extension UserListViewController: UserListAdapterDelegate {
    func onCellSelected(at index: Int) {
        viewModel.showDetail(for: index)
    }
}

extension UserListViewController: UserDetailViewControllerDelegate {
    func updateUser(value: User) {
        viewModel.updateUser(value: value)
    }
}
