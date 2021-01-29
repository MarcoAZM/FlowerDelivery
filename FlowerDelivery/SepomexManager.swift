//
//  SepomexManager.swift
//  FlowerDelivery
//
//  Created by Mac14 on 21/01/21.
//  Copyright © 2021 Zavala. All rights reserved.
//

import Foundation

protocol SepomexManagerDelegate {
    func getEstados(Estados: EstadosModel)
    func getMunicipios(Municipios: MunicipiosModel)
    func getCps(Cps: CpsModel)
    func getColonias(Colonias: ColoniasModel)
}

struct SepomexManager {
    var delegate: SepomexManagerDelegate?
    
    let urlEstados = "https://api-sepomex.hckdrk.mx/query/get_estados"
    let urlMunicipios = "https://api-sepomex.hckdrk.mx/query/get_municipio_por_estado/"
    let urlCps = "https://api-sepomex.hckdrk.mx/query/get_cp_por_municipio/"
    let urlColonias = "https://api-sepomex.hckdrk.mx/query/get_colonia_por_cp/"
    
    func fetchEstados() {
        if let url = URL(string: urlEstados){
            let session = URLSession(configuration: .default)
            let tarea = session.dataTask(with: url) { (data, respuesta, error) in
                if error != nil {
                    print("Error1")
                    return
                }
                if let datosSeguros = data {
                    if let estados = self.parseEstados(estadosData: datosSeguros){
                        self.delegate?.getEstados(Estados: estados)
                    }
                }
            }
            tarea.resume()
        }
    }
    
    func fetchMunicipios(estado: String) {
        let urlString = urlMunicipios+estado
        print("link \(urlString)")
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let tarea = session.dataTask(with: url) { (data, respuesta, error) in
                if error != nil {
                    print("Error1")
                    return
                }
                if let datosSeguros = data {
                    if let municipios = self.parseMunicipios(municipiosData: datosSeguros){
                        self.delegate?.getMunicipios(Municipios: municipios)
                    }
                }
            }
            tarea.resume()
        }
    }
    
    func fetchCps(municipio: String) {
        let urlString = urlCps+municipio
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let tarea = session.dataTask(with: url) { (data, respuesta, error) in
                if error != nil {
                    print("Error1")
                    return
                }
                if let datosSeguros = data {
                    if let cps = self.parseCps(cpsData: datosSeguros){
                        self.delegate?.getCps(Cps: cps)
                    }
                }
            }
            tarea.resume()
        }
    }
    
    func fetchColonias(cp: String) {
        let urlString = urlColonias+cp
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let tarea = session.dataTask(with: url) { (data, respuesta, error) in
                if error != nil {
                    print("Error1")
                    return
                }
                if let datosSeguros = data {
                    if let colonias = self.parseColonias(coloniasData: datosSeguros){
                        self.delegate?.getColonias(Colonias: colonias)
                    }
                }
            }
            tarea.resume()
        }
    }
    
    func parseEstados(estadosData: Data) -> EstadosModel? {
        let decoder = JSONDecoder()
        do {
            let dataDecodificada = try decoder.decode(EstadosData.self, from: estadosData)
            return EstadosModel(estados: dataDecodificada.response.estado)
        }catch {
            print("Error2")
            return nil
        }
    }
    
    func parseMunicipios(municipiosData: Data) -> MunicipiosModel? {
        let decoder = JSONDecoder()
        do {
            let dataDecodificada = try decoder.decode(MunicipiosData.self, from: municipiosData)
            return MunicipiosModel(municipios: dataDecodificada.response.municipios)
        }catch {
            print("Error2")
            return nil
        }
    }
    
    func parseCps(cpsData: Data) -> CpsModel? {
        let decoder = JSONDecoder()
        do {
            let dataDecodificada = try decoder.decode(CpsData.self, from: cpsData)
            return CpsModel(cps: dataDecodificada.response.cp)
        }catch {
            print("Error2")
            return nil
        }
    }
    
    func parseColonias(coloniasData: Data) -> ColoniasModel? {
        let decoder = JSONDecoder()
        do {
            let dataDecodificada = try decoder.decode(ColoniasData.self, from: coloniasData)
            return ColoniasModel(colonias: dataDecodificada.response.colonia)
        }catch {
            print("Error2")
            return nil
        }
    }
}
