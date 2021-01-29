//
//  AddressListViewController.swift
//  FlowerDelivery
//
//  Created by Mac14 on 27/01/21.
//  Copyright © 2021 Zavala. All rights reserved.
//

import UIKit

class AddressListViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var addressLine1: UILabel!
    @IBOutlet weak var addressLine2: UILabel!
    @IBOutlet weak var addressLine3: UILabel!
    @IBOutlet weak var addressLine4: UILabel!
    @IBOutlet weak var direccionField: UITextField!
    
    let direccionesPicker = UIPickerView()
    
    private let coreDataManager = CoreDataManager()
    var direcciones: [String] = []
    
    var dirs: [Address] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dirs = coreDataManager.fetchDirecciones()
        
        for dir in dirs {
            direcciones.append(dir.nombre!);
        }
        
        addressLine1.text = dirs.first?.nombre
        addressLine2.text = "\(dirs.first?.calle ?? "")"
        addressLine3.text = "\(dirs.first?.colonia ?? ""), \(dirs.first?.cp ?? "")"
        addressLine4.text = "\(dirs.first?.municipio ?? ""), \(dirs.first?.estado ?? "")"
    }
    
    @IBAction func direccionSeleccionada(_ sender: UITextField) {
        for dir in dirs {
            if dir.nombre == direccionField.text {
                addressLine1.text = dir.nombre
                addressLine2.text = "\(dir.calle ?? "")"
                addressLine3.text = "\(dir.colonia ?? ""), \(dir.cp ?? "")"
                addressLine4.text = "\(dir.municipio ?? ""), \(dir.estado ?? "")"
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
