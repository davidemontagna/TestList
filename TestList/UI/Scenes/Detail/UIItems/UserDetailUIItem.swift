//
//  UserDetailUIItem.swift
//  TestList
//
//  Created by Davide Montagna on 05/08/22.
//

import Foundation

enum UserDetailUIItem {
    case userData(UserDetailArgs)
    case header(String)
    case separator
    case buttons(Bool)
}

struct UserDetailArgs {
    let title: String
    let value: String
    let type: UserDetailType
}

enum UserDetailType {
    case name
    case username
    case email
    case phone
    case streetAddress
    case suite
    case city
    case zipCode
    case website
    case companyName
    case catchPhrase
}
