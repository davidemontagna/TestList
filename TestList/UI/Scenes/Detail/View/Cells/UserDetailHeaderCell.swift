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
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public methods
    
    func config(title: String) {
        titleLabel.text = title
    }
}
