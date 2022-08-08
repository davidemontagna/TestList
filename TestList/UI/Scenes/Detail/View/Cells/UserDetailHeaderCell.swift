//
//  UserDetailHeaderCell.swift
//  TestList
//
//  Created by Davide Montagna on 08/08/22.
//

import UIKit

class UserDetailHeaderCell: UITableViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Public methods
    
    func config(title: String) {
        titleLabel.text = title
    }
}
