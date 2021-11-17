//
//  CoinViewModel.swift
//  DhBank
//
//  Created by Diego Honorio on 08/11/21.
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
