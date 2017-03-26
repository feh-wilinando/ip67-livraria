//
//  AutorClient.swift
//  ip67-Livraria
//
//  Created by Nando on 25/03/17.
//  Copyright © 2017 Nando. All rights reserved.
//


import Alamofire
import AlamofireObjectMapper

class AutorClient {

    private let URL_BASE = "http://localhost:8080/autors/"
    typealias AutorResponse = (Autor?)->Void
    typealias AutoresResponse = ([Autor]?)->Void
    
    func findById(_ id:Int, completion: @escaping AutorResponse) throws {
        
        let url = try  URL_BASE.asURL()
        
        Alamofire
            .request(url.appendingPathComponent(id.description))
            .validate(statusCode: 200..<300)
            .responseObject { (response: DataResponse<Autor>) in
                completion(response.value)
        }
    }
    
    
    func findAll(completion: @escaping AutoresResponse) {
        Alamofire
            .request(URL_BASE)
            .validate(statusCode: 200..<300)
            .responseArray { (response: DataResponse<[Autor]>) in
                completion(response.value)
        }
                        
    }
    
}
