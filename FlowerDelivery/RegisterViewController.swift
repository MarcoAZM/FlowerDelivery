//
//  RegisterViewController.swift
//  FlowerDelivery
//
//  Created by Mac14 on 28/01/21.
//  Copyright © 2021 Zavala. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let coreDataManager = CoreDataManager()
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var password2Field: UITextField!
    @IBOutlet weak var usuarioField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Te vas a registrar");
    }
    
    @IBAction func registrar(_ sender: UIButton) {
        coreDataManager.createUser(username: usuarioField.text!, password: passwordField.text!, password_repeat: password2Field.text!) { [weak self] in
            print("Usuario registrado")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
