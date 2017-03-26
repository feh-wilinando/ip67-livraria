//
//  Autor.swift
//  ip67-Livraria
//
//  Created by Nando on 25/03/17.
//  Copyright © 2017 Nando. All rights reserved.
//


import ObjectMapper

class Autor: Mappable, CustomStringConvertible {

    var nome: String!
    var description: String {
        get{
            return "Autor(\(nome))"
        }
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        nome <- map["nome"]
    }
    
}
