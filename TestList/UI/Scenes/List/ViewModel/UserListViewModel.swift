//
//  UserListViewModel.swift
//  TestList
//
//  Created by Davide Montagna on 03/08/22.
//

import Foundation
import Alamofire

protocol UserListViewModelDelegate: AnyObject {
    func onSuccess(_ type: UserListViewModelUseCases)
    func onFailure(error: String)
}

class UserListViewModel: NSObject {
    
    // MARK: - Delegate
    
    weak var delegate: UserListViewModelDelegate?
    
    // MARK: - Properties
    
    var selectedItemIndex: Int?
    var responseItems: [User] = []
    var uiitems: [UserListCellUIItem] {
        return responseItems.map { i in
            // Creating uiitem
            return UserListCellUIItem(initials: generateInitials(from: i.name),
                                      name: i.name,
                                      username: i.username,
                                      email: i.email,
                                      phone: i.phone)
        }
    }
    
    // MARK: ViewModel Lifecycle
    
    init(delegate: UserListViewModelDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Public methods
    
    func getUsers() {
        AF.request("https://jsonplaceholder.typicode.com/users").responseDecodable(of: UserResponse.self) { response in
            switch response.result {
            case .failure(let error):
                self.delegate?.onFailure(error: error.localizedDescription)
            case .success(let response):
                self.responseItems = response
                self.delegate?.onSuccess(.getUsers)
            }
        }
    }
    
    func showDetail(for index: Int) {
        selectedItemIndex = index
        delegate?.onSuccess(.showDetail)
    }
    
    func updateUser(value: User) {
        if let index = selectedItemIndex {
            responseItems[index] = value
            delegate?.onSuccess(.updateUser)
        }
    }
    
    // MARK: - Private methods
    
    private func generateInitials(from name: String) -> String {
        var initials: String = ""
        
        let splittedName = name.split(separator: " ")
        splittedName.forEach { word in
            initials = initials + String(word.prefix(1))
        }
        return initials.uppercased()
    }
}

