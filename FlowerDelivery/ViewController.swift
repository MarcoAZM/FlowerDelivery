//
//  ViewController.swift
//  FlowerDelivery
//
//  Created by Mac14 on 18/01/21.
//  Copyright © 2021 Zavala. All rights reserved.
//

import UIKit

class ViewController: UIViewController/*, UIPickerViewDataSource, UIPickerViewDelegate*/ {
    /*
    let options = ["Hola", "Cara de", "Bola"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerField.text = options[row]
    }
     */

    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*let PickerView = UIPickerView()
        PickerView.delegate = self
        passwordField.inputView = PickerView*/
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

