//
//  AddressFormViewController.swift
//  FlowerDelivery
//
//  Created by Mac14 on 21/01/21.
//  Copyright © 2021 Zavala. All rights reserved.
//

import UIKit

class AddressFormViewController: UIViewController, SepomexManagerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    private let manager = CoreDataManager()
    
    var estados = ["Estados"]
    var municipios = ["Municipios"]
    var cps = ["CPs"]
    var colonias = ["Colonias"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == estadosPicker {
            return estados.count
        }
        else if pickerView == municipiosPicker {
            return municipios.count
        }
        else if pickerView == cpsPicker {
            return cps.count
        }
        else if pickerView == coloniasPicker {
            return colonias.count
        }
        else {
            return 1
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == estadosPicker {
            return estados[row]
        }
        else if pickerView == municipiosPicker {
            return municipios[row]
        }
        else if pickerView == cpsPicker {
            return cps[row]
        }
        else if pickerView == coloniasPicker {
            return colonias[row]
        }
        else {
            return "Hola"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == estadosPicker {
            estadosField.text = estados[row]
        }
        else if pickerView == municipiosPicker {
            municipiosField.text = municipios[row]
        }
        else if pickerView == cpsPicker {
            cpsField.text = cps[row]
        }
        else if pickerView == coloniasPicker {
            coloniasField.text = colonias[row]
        }
    }
    
    @IBOutlet weak var coloniasField: UITextField!
    @IBOutlet weak var cpsField: UITextField!
    @IBOutlet weak var municipiosField: UITextField!
    @IBOutlet weak var estadosField: UITextField!
    @IBOutlet weak var nombreField: UITextField!
    @IBOutlet weak var calleField: UITextField!
    
    let estadosPicker = UIPickerView()
    let municipiosPicker = UIPickerView()
    let cpsPicker = UIPickerView()
    let coloniasPicker = UIPickerView()
    
    func getEstados(Estados: EstadosModel) {
        print(Estados.estados)
        estados = Estados.estados
    }
    
    func getMunicipios(Municipios: MunicipiosModel) {
        print(Municipios.municipios)
        municipios = Municipios.municipios
    }
    
    func getCps(Cps: CpsModel) {
        print(Cps.cps)
        cps = Cps.cps
    }
    
    func getColonias(Colonias: ColoniasModel) {
        print(Colonias.colonias)
        colonias = Colonias.colonias
    }
    
    var sepomexManager = SepomexManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Declaracion de delegados
        estadosPicker.delegate = self
        municipiosPicker.delegate = self
        cpsPicker.delegate = self
        coloniasPicker.delegate = self
        sepomexManager.delegate = self
        
        //Metodos del manager
        sepomexManager.fetchEstados()
        
        //PickerViews
        estadosField.inputView = estadosPicker
        municipiosField.inputView = municipiosPicker
        cpsField.inputView = cpsPicker
        coloniasField.inputView = coloniasPicker
        
    }
    
    @IBAction func estadoSeleccionado(_ sender: UITextField) {
        sepomexManager.fetchMunicipios(estado: estadosField.text!)
    }
    
    @IBAction func municipioSeleccionado(_ sender: UITextField) {
        sepomexManager.fetchCps(municipio: municipiosField.text!)
    }
    
    @IBAction func cpSeleccionado(_ sender: UITextField) {
        sepomexManager.fetchColonias(cp: cpsField.text!)
    }
    
    @IBAction func createRecords(_ sender: UIButton) {
        manager.createAddress(nombre: nombreField.text!, estado: estadosField.text!, municipio: municipiosField.text!, cp: cpsField.text!, colonia: coloniasField.text!, calle: calleField.text!) { [weak self] in
            print("Direcciones guardada")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
