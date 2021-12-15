//
//  CoinModel.swift
//  DhBank
//
//  Created by Diego Honorio on 08/11/21.
//
//
//import Foundation
//
//// MARK: - WelcomeValue
//struct CoinModel: Codable {
//    let code: String
//    let codein: Codein
//    let name, high, low, varBid: String
//    let pctChange, bid, ask, timestamp: String
//    let createDate: String
//
//    enum CodingKeys: String, CodingKey {
//        case code, codein, name, high, low, varBid, pctChange, bid, ask, timestamp
//        case createDate = "create_date"
//    }
//}
//
//enum Codein: String, Codable {
//    case brl = "BRL"
//    case brlt = "BRLT"
//}
//
//typealias CoinModels = [String: CoinModel]

import Foundation

// MARK: - Welcome
struct CoinModel: Codable {
    let usdbrl: Usdbrl

    enum CodingKeys: String, CodingKey {
        case usdbrl = "USDBRL"
    }
}

// MARK: - Usdbrl
struct Usdbrl: Codable {
    let code, codein, name, high: String
    let low, varBid, pctChange, bid: String
    let ask, timestamp, createDate: String

    enum CodingKeys: String, CodingKey {
        case code, codein, name, high, low, varBid, pctChange, bid, ask, timestamp
        case createDate = "create_date"
    }
}

