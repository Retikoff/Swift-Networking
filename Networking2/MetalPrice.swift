//
//  MetalPrice.swift
//  Networking2
//
//  Created by Student on 24.05.25.
//

import Foundation

struct MetalPrice: Codable, Hashable{
    let date:String // на какой момент актуальны цены
    let metalId:Int
    let nominal:Double // вес
    let noCertificateDollars:Double? // цена покупки без сертификата качества
    let noCertificateRubles:Double?
    let certificateDollars:Double? // цена покупки с сертификатом качества
    let certificateRubles: Double?
    let banksDollars:Double // цена продажи банкам
    let banksRubles:Double
    let entitiesDollars:Double // цена продажи юр и физлицам
    let entitiesRubles: Double
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case metalId = "MetalID"
        case nominal = "Nominal"
        case noCertificateDollars = "NoCertificateDollars"
        case noCertificateRubles = "NoCertificateRubles"
        case certificateDollars = "CertificateDollars"
        case certificateRubles = "CertificateRubles"
        case banksDollars = "BanksDollars"
        case banksRubles = "BanksRubles"
        case entitiesDollars = "EntitiesDollars"
        case entitiesRubles = "EntitiesRubles"
    }
}
