//
//  PaymentViewController.swift
//  FlowerDelivery
//
//  Created by Mac14 on 28/01/21.
//  Copyright © 2021 Zavala. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var tarjetaField: UITextField!
    @IBOutlet weak var direccionsField: UITextField!
    
    @IBOutlet weak var lineAddress1: UILabel!
    @IBOutlet weak var lineAddress2: UILabel!
    @IBOutlet weak var lineAddress3: UILabel!
    @IBOutlet weak var lineAddress4: UILabel!
    
    private let coreDataManager = CoreDataManager()
    
    var direcciones: [String] = []
    var dirs: [Address] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dirs = coreDataManager.fetchDirecciones()
        print(dirs)
        
        lineAddress1.text = dirs.first?.calle
        lineAddress2.text = dirs.first?.colonia
        lineAddress3.text = "C.P. \(dirs.first?.cp ?? "")"
        lineAddress4.text = "\(dirs.first?.municipio ?? ""), \(dirs.first?.estado ?? "")"
        
    }
    
    @IBAction func direccionSeleccionada(_ sender: UITextField) {
        for dir in dirs {
            if dir.nombre == direccionsField.text{
                lineAddress1.text = dir.calle
                lineAddress2.text = dir.colonia
                lineAddress3.text = "C.P. \(dir.cp ?? "")"
                lineAddress4.text = "\(dir.municipio ?? ""), \(dir.estado ?? "")"
            }
        }
    }
    
    @IBAction func pagar(_ sender: UIButton) {

        let tarjeta:String = tarjetaField.text!
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
