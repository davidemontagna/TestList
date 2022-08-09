//
//  UserDetailCell.swift
//  TestList
//
//  Created by Davide Montagna on 05/08/22.
//

import UIKit

protocol UserDetailCellDelegate: AnyObject {
    func dataDidChanged(value: String, type: UserDetailType)
}

class UserDetailCell: UITableViewCell {
    
    // MARK: - Delegate
    
    weak var delegate: UserDetailCellDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!    
    @IBOutlet weak var dataUserTextField: UITextField!
    
    // MARK: - Properties
    
    var infoType: UserDetailType!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Public methods
    
    func config(with delegate: UserDetailCellDelegate, and args: UserDetailArgs) {
        titleLabel.text = args.title
        dataUserTextField.text = args.value
        infoType = args.type
        self.delegate = delegate
    }
    
    // MARK: - Actions
    
    @IBAction func dataChanged(_ sender: Any) {
        delegate?.dataDidChanged(value: dataUserTextField.text ?? "", type: infoType)
    }
}
