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
    
    var responseItems: [UserResponse] = []
    
    // MARK: - Properties
    
    var uiitems: [UserResponse] {
            getUsers()
        }
    }
    
    func getUsers() -> DataRequest {
        return AF.request("https://jsonplaceholder.typicode.com/users").response { response in
            switch response.result {
            case .failure(let error):
                self.delegate?.onFailure(error: error.localizedDescription)
            case .success(let response):
                self.responseItems = response
                self.delegate?.onSuccess(.getUsers, nil)
            }
    }
}
