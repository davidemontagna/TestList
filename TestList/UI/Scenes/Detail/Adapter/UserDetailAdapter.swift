//
//  UserDetailAdapter.swift
//  TestList
//
//  Created by Davide Montagna on 05/08/22.
//

import Foundation
import UIKit

protocol UserDetailAdapterDelegate {
    func saveTapped()
    func dataDidChanged(value: String, type: UserDetailType)
}

class UserDetailAdapter: NSObject {
    
    // MARK: - Delegate
    
    var delegate: UserDetailAdapterDelegate?
    
    // MARK: - Properties
    
    var uiitems: [UserDetailUIItem] = []
    
    // MARK: - Adapter Lifecycle
    
    init(delegate: UserDetailAdapterDelegate) {
        self.delegate = delegate
    }
}

// MARK: - Extensions

extension UserDetailAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uiitems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch uiitems[indexPath.row] {
        case .userData(let args):
            let cell: UserDetailCell = tableView.dequeueReusableCell(for: UserDetailCell.self, for: indexPath)
            cell.config(with: self, and: args)
            return cell
        case .header(let args):
            let cell: UserDetailHeaderCell = tableView.dequeueReusableCell(for: UserDetailHeaderCell.self, for: indexPath)
            cell.config(title: args)
            return cell
        case .separator:
            let cell: UserDetailSeparatorCell = tableView.dequeueReusableCell(for: UserDetailSeparatorCell.self, for: indexPath)
            return cell
        case .buttons(let args):
            let cell: UserDetailButtonsCell = tableView.dequeueReusableCell(for: UserDetailButtonsCell.self, for: indexPath)
            cell.config(with: self, and: args)
            return cell
        }
    }
}

extension UserDetailAdapter: UITableViewDelegate {

}

extension UserDetailAdapter: UserDetailButtonsCellDelegate {
    func saveTapped() {
        delegate?.saveTapped()
    }
}

extension UserDetailAdapter: UserDetailCellDelegate {
    func dataDidChanged(value: String, type: UserDetailType) {
        delegate?.dataDidChanged(value: value, type: type)
    }
}
