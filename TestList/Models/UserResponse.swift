//
//  User.swift
//  TestList
//
//  Created by Davide Montagna on 03/08/22.
//

import Foundation

struct UserResponse: Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: AddressResponse
    var phone: String
    var webSite: String
    var company: CompanyResponse
}
