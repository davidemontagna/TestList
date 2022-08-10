//
//  UserDetailViewModel.swift
//  TestList
//
//  Created by Davide Montagna on 05/08/22.
//

import Foundation

protocol UserDetailViewModelDelegate: AnyObject {
    func onSuccess(by useCase: UserDetailViewModelUseCases)
    func onFailure(error: String)
}

class UserDetailViewModel: NSObject {
    
    // MARK: - Delegate
    
    weak var delegate: UserDetailViewModelDelegate?
    
    // MARK: Properties
    
    var isValid = true
    var detailItem: User!
    var uiitems: [UserDetailUIItem] {
        var items: [UserDetailUIItem] = []
        items.append(.header("Informazioni"))
        items.append(.userData(UserDetailArgs(title: "Nome:", value: detailItem.name, type: .name)))
        items.append(.userData(UserDetailArgs(title: "Username:", value: detailItem.username, type: .username)))
        items.append(.separator)
        items.append(.userData(UserDetailArgs(title: "Email:", value: detailItem.email, type: .email)))
        items.append(.userData(UserDetailArgs(title: "Phone:", value: detailItem.phone, type: .phone)))
        items.append(.separator)
        items.append(.userData(UserDetailArgs(title: "Street address:", value: detailItem.address.street, type: .streetAddress)))
        items.append(.userData(UserDetailArgs(title: "Suite:", value: detailItem.address.suite, type: .suite)))
        items.append(.userData(UserDetailArgs(title: "City:", value: detailItem.address.city, type: .city)))
        items.append(.userData(UserDetailArgs(title: "Zipcode:", value: detailItem.address.zipcode, type: .zipCode)))
        items.append(.separator)
        items.append(.userData(UserDetailArgs(title: "Website:", value: detailItem.website, type: .website)))
        items.append(.userData(UserDetailArgs(title: "Company name:", value: detailItem.company.name, type: .companyName)))
        items.append(.userData(UserDetailArgs(title: "Catch Phrase:", value: detailItem.company.catchPhrase, type: .catchPhrase)))
        items.append(.buttons(isValid))
        return items
    }
    
    // MARK: - ViewModel Lifecycle
    
    init(delegate: UserDetailViewModelDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Public methods
    
    func update() {
        delegate?.onSuccess(by: .update)
    }
    
    func set(value: String, type: UserDetailType) {
        switch type {
        case .name:
            detailItem.name = value
        case .username:
            detailItem.username = value
        case .email:
            detailItem.email = value
        case .phone:
            detailItem.phone = value
        case .streetAddress:
            detailItem.address.street = value
        case .suite:
            detailItem.address.suite = value
        case .city:
            detailItem.address.city = value
        case .zipCode:
            detailItem.address.zipcode = value
        case .website:
            detailItem.website = value
        case .companyName:
            detailItem.company.name = value
        case .catchPhrase:
            detailItem.company.catchPhrase = value
        }
        checkData()
    }
    
    // MARK: - Private methods
    
    private func checkData() {
        isValid = detailItem.name != "" && detailItem.username != "" && detailItem.email != ""  && detailItem.phone != "" &&         detailItem.address.street != "" && detailItem.address.suite != "" && detailItem.address.city != "" && detailItem.address.zipcode != "" && detailItem.website != "" && detailItem.company.name != ""
        delegate?.onSuccess(by: .refresh)
    }
}
