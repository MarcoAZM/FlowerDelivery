//
//  EstadosData.swift
//  FlowerDelivery
//
//  Created by Mac14 on 21/01/21.
//  Copyright © 2021 Zavala. All rights reserved.
//

import Foundation

struct EstadosData: Codable{
    let response: responseEstado
}

struct responseEstado: Codable{
    let estado: [String]
}
