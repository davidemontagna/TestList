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
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    // MARK: - Public methods
    
    func config(with user: UserListCellUIItem) {
        nameLabel.text = user.name
        idLabel.text = user.id
        usernameLabel.text = user.username
        emailLabel.text = user.email
        phoneLabel.text = user.phone
    }
}
