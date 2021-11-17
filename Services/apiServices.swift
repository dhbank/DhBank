//
//  apiServices.swift
//  DhBank
//
//  Created by Diego Honorio on 08/11/21.
//

import Foundation
import Alamofire

class apiServices {
    
    let urlAllUSD = "https://economia.awesomeapi.com.br/last/USD-BRL"
    
    let urlAllEUR = "https://economia.awesomeapi.com.br/last/EUR-BRL"
    
    func getAllDataUSD(completion: @escaping (CoinModel?) -> Void) {
        AF.request(urlAllUSD).responseDecodable(of: CoinModel.self) { response in
            completion(response.value)
        }
    }
    func getAllDataEUR(completion: @escaping (CoinModelEUR?) -> Void) {
        AF.request(urlAllEUR).responseDecodable(of: CoinModelEUR.self) { response in
            completion(response.value)
        }
    }
    
}
