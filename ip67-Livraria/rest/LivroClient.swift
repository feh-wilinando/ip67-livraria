//
//  LivroClient.swift
//  ip67-Livraria
//
//  Created by Nando on 25/03/17.
//  Copyright © 2017 Nando. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class LivroClient {

    private let URL_BASE = "http://localhost:8080/livroes/"
    typealias LivroResponse = (Livro?)->Void
    typealias LivrosResponse = ([Livro]?)->Void
    
    
    func findById(_ id:Int, completion: @escaping LivroResponse) throws {
        
        let url = try  URL_BASE.asURL()
        
        Alamofire
            .request(url.appendingPathComponent(id.description))
            .validate(statusCode: 200..<300)
            .responseObject { (response: DataResponse<Livro>) in
                completion(response.value)
        }
    }
    
    func findAll(completion: @escaping LivrosResponse) {
        Alamofire
            .request(URL_BASE)
            .validate(statusCode: 200..<300)
            .responseArray { (response: DataResponse<[Livro]>) in
                completion(response.value)
        }
        
    }
}
