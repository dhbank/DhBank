//
//  DhBankTests.swift
//  DhBankTests
//
//  Created by DiegoH on 29/12/21.
//

import XCTest
@testable import DhBank


class DhBankTests: XCTestCase {



    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testeCoreAppHomeViewModel_dadoQueFuncaoEhChamadaNaHOmeVIew_QuandoRetornaOsDadosdaAPI_OResultadoDeveSerSempreVezesDOIS(){
     
        let viewModel = HomeViewModel()
        
        let valor = Double("2") ?? 0
        let valorParametro = Double("2") ?? 0
        
        print("Testes01 -> Sou o teste da funcao CoreAPP, estou testando a multiplicacao dos valores 2x2 com resultado de 4.0")
        
        
        let calculouCerto = viewModel.coreApp(valor: valor, valorParametro: valorParametro)
        
        
        print("Testes01 -> O Resultado foi: \(calculouCerto)")
        
        
        XCTAssertEqual(calculouCerto, "4.0")
        
    }
    
    func testeCoreAppHomeViewModel_dadoQueFuncaoEhChamadaNaHOmeVIew_QuandoRetornaOsDadosdaAPI_OResultadoDeveSerSempreFALSO(){
     
        let viewModel = HomeViewModel()
        
        let valor = Double("1") ?? 0
        let valorParametro = Double("2") ?? 0
        
        print("Testes02 -> Sou o teste da funcao CoreAPP, estou fazendo um reverso, 1x2 = 4.0 o resultado deve ser false")
        
        let calculouCerto = viewModel.coreApp(valor: valor, valorParametro: valorParametro)
        
        print(">>> \(calculouCerto)")
        
        let result = calculouCerto == "4.0" ? true : false
    
        print("Testes02 -> O Resultado foi: \(result)")
        
        XCTAssertFalse(result)
    }
    
    

    
    
}
