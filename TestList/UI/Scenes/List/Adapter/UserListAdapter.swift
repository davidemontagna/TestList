//
//  UserListAdapter.swift
//  TestList
//
//  Created by Davide Montagna on 03/08/22.
//

import Foundation
import UIKit

protocol UserListAdapterDelegate {
    func onCellSelected(at index: Int)
}

class UserListAdapter: NSObject {
    
    // MARK: - Delegate
    
    var delegate: UserListAdapterDelegate?
    
    // MARK: - Properties
    
    var uiitems: [UserListCellUIItem] = []
}

// MARK: - Extensions

extension UserListAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uiitems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserListCell = tableView.dequeueReusableCell(for: UserListCell.self, for: indexPath)
        cell.config(with: uiitems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onCellSelected(at: indexPath.row)
    }
}

extension UserListAdapter: UITableViewDelegate {
    
}
