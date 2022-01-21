//
//  CoinModelEUR.swift
//  DhBank
//
//  Created by Diego Honório on 05/01/22.
//

import Foundation

// MARK: - Welcome
struct CoinModelEUR: Codable {
    let eurbrl: Eurbrl

    enum CodingKeys: String, CodingKey {
        case eurbrl = "EURBRL"
    }
}

// MARK: - Eurbrl
struct Eurbrl: Codable {
    let code, codein, name, high: String
    let low, varBid, pctChange, bid: String
    let ask, timestamp, createDate: String

    enum CodingKeys: String, CodingKey {
        case code, codein, name, high, low, varBid, pctChange, bid, ask, timestamp
        case createDate = "create_date"
    }
}
