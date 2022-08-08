//
//  UserDetailButtonsCell.swift
//  TestList
//
//  Created by Davide Montagna on 08/08/22.
//

import UIKit

protocol UserDetailButtonsCellDelegate {
    func saveTapped()
}

class UserDetailButtonsCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - Delegate
    
    var delegate: UserDetailButtonsCellDelegate?
    
    // MARK: - Public methods
    
    func config(with delegate: UserDetailButtonsCellDelegate, and args: Bool) {
        saveButton.isEnabled = args
        self.delegate = delegate
    }
    
    // MARK: - Actions
    
    @IBAction func saveChangesTapped(_ sender: Any) {
        delegate?.saveTapped()
    }
}
