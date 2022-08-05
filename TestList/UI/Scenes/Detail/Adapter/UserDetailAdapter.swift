//
//  UserDetailAdapter.swift
//  TestList
//
//  Created by Davide Montagna on 05/08/22.
//

import Foundation
import UIKit

class UserDetailAdapter: NSObject {    
    
    // MARK: - Properties
    
    var uiitems: [UserDetailUIItem] = []
}

// MARK: - Extensions

extension UserDetailAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uiitems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserDetailCell = tableView.dequeueReusableCell(for: UserDetailCell.self, for: indexPath)
        cell.config(userData: uiitems[indexPath.row])
        return cell
    }
}

extension UserDetailAdapter: UITableViewDelegate {

}
