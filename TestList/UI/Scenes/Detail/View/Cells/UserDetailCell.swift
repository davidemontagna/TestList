//
//  UserDetailCell.swift
//  TestList
//
//  Created by Davide Montagna on 05/08/22.
//

import UIKit

class UserDetailCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!    
    @IBOutlet weak var dataUserTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Public methods
    
    func config(userData: UserDetailUIItem) {
        titleLabel.text = userData.title
        dataUserTextField.text = userData.value
    }
}
