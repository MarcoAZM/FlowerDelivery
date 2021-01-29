//
//  MunicipiosData.swift
//  FlowerDelivery
//
//  Created by Mac14 on 26/01/21.
//  Copyright © 2021 Zavala. All rights reserved.
//

import Foundation

struct MunicipiosData: Codable{
    let response: responseMunicipio
}

struct responseMunicipio: Codable{
    let municipios: [String]
}
