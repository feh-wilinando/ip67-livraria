//
//  Autores.swift
//  ip67-Livraria
//
//  Created by Nando on 25/03/17.
//  Copyright © 2017 Nando. All rights reserved.
//


import ObjectMapper

class Autores: Mappable {

    var autores: [Autor]!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        autores <- map["_embedded.autors"]
    }
    
}
