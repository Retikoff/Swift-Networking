//
//  ApiService.swift
//  Networking2
//
//  Created by Student on 24.05.25.
//

import Foundation
import Alamofire
import Combine

class ApiService{
    static let BASE_URL_METALS = "https://api.nbrb.by/metals"
    static let BASE_URL_PRICES = "https://api.nbrb.by/ingots/prices"
    
    func getMetals() -> AnyPublisher<[Metal], AFError> {
        let publisher = AF.request(ApiService.BASE_URL_METALS, method: .get)
            .publishDecodable(type: [Metal].self)
        
        return publisher.value()
    }
    
    func getPrices() -> AnyPublisher<[MetalPrice], AFError> {
        let publisher = AF.request(ApiService.BASE_URL_PRICES, method: .get)
            .publishDecodable(type: [MetalPrice].self)
        
        return publisher.value()
    }
}
