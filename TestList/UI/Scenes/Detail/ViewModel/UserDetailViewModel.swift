//
//  UserDetailViewModel.swift
//  TestList
//
//  Created by Davide Montagna on 05/08/22.
//

import Foundation

protocol UserDetailViewModelDelegate: AnyObject {
    func onSuccess(_ type: UserDetailViewModelUseCases)
    func onFailure(error: String)
}

class UserDetailViewModel: NSObject {
    
    // MARK: - Delegate
    
    weak var delegate: UserDetailViewModelDelegate?
    
    // MARK: Properties
    
    var detailItem: User!
    var uiitems: [UserDetailUIItem] {
        var items: [UserDetailUIItem] = []
        items.append(UserDetailUIItem(title: "Nome", value: "Davide"))
        items.append(UserDetailUIItem(title: "Username", value: "Montagna"))
//        items.append(UserDetailUIItem(title: "Email", value: detailItem.email))
//        items.append(UserDetailUIItem(title: "Street address", value: detailItem.address.street))
//        items.append(UserDetailUIItem(title: "Suite", value: detailItem.address.suite))
//        items.append(UserDetailUIItem(title: "City", value: detailItem.address.city))
//        items.append(UserDetailUIItem(title: "Zipcode", value: detailItem.address.zipcode))
//        items.append(UserDetailUIItem(title: "Phone", value: detailItem.phone))
//        items.append(UserDetailUIItem(title: "Website", value: detailItem.website))
//        items.append(UserDetailUIItem(title: "Company name", value: detailItem.company.name))
//        items.append(UserDetailUIItem(title: "Catch Phrase", value: detailItem.company.catchPhrase))
        return items
    }
    
    // MARK: - Public methods
    
    func showDetail() {
        
    }
}
