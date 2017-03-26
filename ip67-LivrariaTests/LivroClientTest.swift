//
//  LivroClientTest.swift
//  ip67-Livraria
//
//  Created by Nando on 25/03/17.
//  Copyright © 2017 Nando. All rights reserved.
//

import XCTest
@testable import ip67_Livraria
class LivroClientTest: XCTestCase {
    
    let client = LivroClient()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testDeveConseguirBuscarUmLivroPeloId() throws {
        
        
        try client.findById(1) { (livroResponse) in
            
            guard let livro = livroResponse else {
                XCTFail("Livro não carregado")
                return
            }
            
            XCTAssertEqual("Spring MVC", livro.titulo)
            XCTAssertEqual("Domine o principal framework web Java", livro.sumario)
            XCTAssertEqual(237, livro.numeroDePaginas)
        }
    }
    
    
    func testDeveRetornarUmaListaDeAutores(){
        client.findAll { (livrosResponse) in
            guard let livros = livrosResponse else {
                XCTFail("Livros não carregados")
                return
            }
            
            XCTAssertEqual(1, livros.count)
            XCTAssertEqual("Spring MVC", livros[0].titulo)
            XCTAssertEqual("Domine o principal framework web Java", livros[0].sumario)
            XCTAssertEqual(237, livros[0].numeroDePaginas)
        }
    }
    
}
