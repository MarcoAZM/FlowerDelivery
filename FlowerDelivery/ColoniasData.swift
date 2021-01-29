//
//  ColoniasData.swift
//  FlowerDelivery
//
//  Created by Mac14 on 26/01/21.
//  Copyright © 2021 Zavala. All rights reserved.
//

import Foundation

struct ColoniasData: Codable{
    let response: responseColonias
}

struct responseColonias: Codable{
    let colonia: [String]
}
