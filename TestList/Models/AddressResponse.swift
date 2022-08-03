//
//  AddressResponse.swift
//  TestList
//
//  Created by Davide Montagna on 03/08/22.
//

import Foundation

struct AddressResponse: Decodable {
    var street: String
    var suite: String
    var city: String
    var zipCode: String
    var geo: GeoResponse
}
