//
//  CoinViewModel.swift
//  DhBank
//
//  Created by Diego Honório on 05/01/22.
//


import Foundation

protocol CoinViewModelDelegate{
    func getAllData()
}

class CoinViewModel{
    
   
    var delegate: CoinViewModelDelegate? = nil
    let service: apiServices = .init()
    
    
    func getAllData(){
       
        service.getAllDataUSD { CoinModel in
            print("teste")
        }
        
    }
    
   
}
