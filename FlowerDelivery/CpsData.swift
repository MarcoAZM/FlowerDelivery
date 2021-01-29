//
//  CpsData.swift
//  FlowerDelivery
//
//  Created by Mac14 on 26/01/21.
//  Copyright © 2021 Zavala. All rights reserved.
//

import Foundation

struct CpsData: Codable{
    let response: responseCps
}

struct responseCps: Codable{
    let cp: [String]
}
