//
//  AutorClientTest.swift
//  ip67-Livraria
//
//  Created by Nando on 25/03/17.
//  Copyright © 2017 Nando. All rights reserved.
//

import XCTest

@testable import ip67_Livraria
class AutorClientTest: XCTestCase {
    
    let client = AutorClient()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDeveConseguirBuscarUmAutorPeloId() throws {
        
        
        try client.findById(1) { (autorResponse) in
            
            guard let autor = autorResponse else {
                XCTFail("Autor não carregado")
                return
            }
            
            XCTAssertEqual("Alberto", autor.nome)
        }
    }
    
    
    func testDeveRetornarUmaListaDeAutores(){
        client.findAll { (autoresResponse) in
            guard let autores = autoresResponse else {
                XCTFail("Autores não carregados")
                return
            }
            
            XCTAssertEqual(1, autores.count)
            XCTAssertEqual("Alberto", autores[0].nome)
        }
    }
    
}
