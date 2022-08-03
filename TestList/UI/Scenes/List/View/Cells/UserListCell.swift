//
//  UserListCell.swift
//  TestList
//
//  Created by Davide Montagna on 03/08/22.
//

import UIKit

class UserListCell: UITableViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Properties
    
    var index: IndexPath!
    
    
    func config(with user: UserResponse) {
        
    }
}
