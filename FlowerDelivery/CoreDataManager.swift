//
//  CoreDataManager.swift
//  FlowerDelivery
//
//  Created by Mac14 on 27/01/21.
//  Copyright © 2021 Zavala. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    private let container: NSPersistentContainer
    private let container_user: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Address")
        container_user = NSPersistentContainer(name: "User")
        setupDatabase()
    }
    
    private func setupDatabase() {
        container.loadPersistentStores { (desc, error) in
            if let error = error {
                print("Error loading store \(desc) - \(error)")
                return
            }
            print("Database ready")
        }
        container_user.loadPersistentStores { (desc, error) in
            if let error = error {
                print("Error loading store \(desc) - \(error)")
                return
            }
            print("Database ready")
        }
    }
    
    func createUser(username: String, password: String, password_repeat: String, completion: @escaping() -> Void) {
        
        let context = container_user.viewContext
        let user = User(context: context)
        
        print("Se va comparar la password")
        
        if password == password_repeat {
            user.user = username
            user.password = password
        }
        
        do {
            try context.save()
            print("Usuario \(username) guardado")
            completion()
        } catch {
            print("Error guardando usuario - \(error)")
        }
        
    }
    
    func login(username: String, password: String) -> Bool{
        let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let result = try container_user.viewContext.fetch(fetchRequest)
            for user in result {
                print (user.user!)
                if username == user.user{
                    if password == user.password{
                        return true;
                    }
                }
            }
            return false
        } catch {
            print("Error obteniendo Usuarios \(error)")
        }
        
        return false
        
    }
    
    func createAddress(nombre: String, estado: String, municipio: String, cp: String, colonia: String, calle: String, completion: @escaping() -> Void) {
        
        let context = container.viewContext
        
        let address = Address(context: context)
        address.nombre = nombre
        address.estado = estado
        address.municipio = municipio
        address.cp = cp
        address.colonia = colonia
        address.calle = calle
        
        do {
            try context.save()
            print("Direccion \(nombre) guardando")
            completion()
        } catch {
            print("Error guardando direccion - \(error)")
        }
        
    }
    
    func fetchDirecciones() -> [Address] {
        let fetchRequest : NSFetchRequest<Address> = Address.fetchRequest()
        
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("Error obteniendo Direcciones \(error)")
        }
        
        return []
    }
}
