//
//  ViewModel.swift
//  Networking2
//
//  Created by Student on 24.05.25.
//

import Foundation
import Alamofire
import Combine

class ViewModel: ObservableObject{
    @Published var metals: [Metal] = []
    @Published var metalPrices: [MetalPrice] = []
    
    var cancellation: AnyCancellable?
    let service = ApiService()
    
    @Published var showPrices = false
    var selectedMetal: Metal? = nil
    
    init(){
        getMetals()
    }
    
    func getMetals(){
        cancellation = service.getMetals()
            .mapError({(error) -> Error in
                print("Download error \(error)")
                return error
            })
            .sink(receiveCompletion: {_ in }, receiveValue: { data in
                self.getMetalPrices()
                self.metals.removeAll()
                self.metals.insert(contentsOf: data, at: 0)
                
                print("Metals list \(self.metals)")
            })
    }
    
    func getMetalPrices(){
        cancellation = service.getPrices()
            .mapError({(error)-> Error in
                print("Download error \(error)")
                return error
            })
            .sink(receiveCompletion: {_ in }, receiveValue: {data in
                self.metalPrices.removeAll()
                self.metalPrices.insert(contentsOf: data, at: 0)
                
                print("MetalPrices list \(self.metalPrices)")
            })
    }
}
