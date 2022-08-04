//
//  UserListViewModel.swift
//  TestList
//
//  Created by Davide Montagna on 03/08/22.
//

import Foundation
import Alamofire

protocol UserListViewModelDelegate: AnyObject {
    func onFailure(error: String)
    func onSuccess(_ type: UserListViewModelUseCases, _ indexPath: IndexPath?)
}

class UserListViewModel: NSObject {
    
    // MARK: - Delegate
    
    weak var delegate: UserListViewModelDelegate?
    
    // MARK: - Properties
    
    var responseItems: [User] = []
    var uiitems: [UserListCellUIItem] {
        return responseItems.map { i in
            // Creating uiitem
            return UserListCellUIItem(id: String(i.id),
                                      name: i.name,
                                      username: i.username,
                                      email: i.email,
                                      phone: i.phone)
        }
    }
    
    // MARK: - Public methods
    
    func getUsers() {
        AF.request("https://jsonplaceholder.typicode.com/users").responseDecodable(of: UserResponse.self) { response in
            switch response.result {
            case .failure(let error):
                self.delegate?.onFailure(error: error.localizedDescription)
            case .success(let response):
                self.responseItems = response
                self.delegate?.onSuccess(.getUsers, nil)
            }
        }
    }
}

