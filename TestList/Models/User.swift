//
//  User.swift
//  TestList
//
//  Created by Davide Montagna on 03/08/22.
//

import Foundation

struct User: Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
}
