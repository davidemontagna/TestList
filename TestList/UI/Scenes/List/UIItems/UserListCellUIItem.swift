//
//  UserListCellUIItem.swift
//  TestList
//
//  Created by Davide Montagna on 03/08/22.
//

import Foundation

struct UserListCellUIItem: Decodable {
    let id: String
    let name: String
    let username: String
    let email: String
    let phone: String
}
