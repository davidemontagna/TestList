//
//  UserListAdapter.swift
//  TestList
//
//  Created by Davide Montagna on 03/08/22.
//

import Foundation
import UIKit

protocol UserListAdapterDelegate {
    
}

class UserListAdapter: NSObject {
    
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
        let data = uiitems[indexPath.item]
        let cell.config(with: data)
        return cell
    }
    
    
}

extension UserListAdapter: UITableViewDelegate {
    
}
