//
//  UserListViewModel.swift
//  TestList
//
//  Created by Davide Montagna on 03/08/22.
//

import Foundation
import Alamofire

class UserListViewModel: NSObject {
    
    // MARK: - Properties
    
    var uiitems: [UserListCellUIItem] {
        AF.request("https://jsonplaceholder.typicode.com/users").response { response in
            debugPrint(response)
        }
    }
}
