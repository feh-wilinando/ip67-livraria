//
//  Livro.swift
//  ip67-Livraria
//
//  Created by Nando on 25/03/17.
//  Copyright © 2017 Nando. All rights reserved.
//


import ObjectMapper

class Livro: Mappable {

    var titulo:String!
    var sumario:String!
    var numeroDePaginas:Int!
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        titulo <- map["titulo"]
        sumario <- map["sumario"]
        numeroDePaginas <- map["numeroDePaginas"]
    }
    
}
