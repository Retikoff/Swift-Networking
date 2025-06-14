//
//  PricesView.swift
//  Networking2
//
//  Created by Student on 24.05.25.
//

import SwiftUI

struct ItemWithNil: Hashable{
    let label:String
    let value:Double?
}

struct ItemWithZero: Hashable{
    let label:String
    let value:Double
}

struct PricesView: View{
    @EnvironmentObject var viewModel: ViewModel
    @State var selectedNominal: String = String(10.0)  
    
    var body: some View{
        VStack(alignment: .leading){
            let suitablePrices = viewModel.metalPrices.filter({$0.metalId == viewModel.selectedMetal?.id})
            
            HStack{
                Spacer()
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding()
                    .onTapGesture {
                        self.viewModel.showPrices = false
                    }
            }
            
            if suitablePrices.isEmpty{
                VStack(alignment: .center){
                    Spacer()
                    Text("На данный момент покупка/продажа " + viewModel.selectedMetal!.name + " невозможна. Попробуйте позже")
                        .bold()
                        .font(.system(size:28))
                        .padding(.leading, 8)
                    Image(systemName: "exclamationmark.octagon")
                        .resizable()
                        .frame(width:100, height:100, alignment: .center)
                        .padding()
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            else{
                Text(viewModel.selectedMetal!.name)
                    .bold()
                    .font(.system(size:30))
                    .padding(.leading, 36)
                HStack{
                    Text("Номинал: ")
                        .font(.system(size:22))
                        .padding(.leading, 12)
                    Menu(selectedNominal){
                        ForEach(suitablePrices, id: \.self){ price in
                            Button(action: {
                                selectedNominal = String(price.nominal)
                            }, label:{
                                Text(String(price.nominal))
                                    .font(.system(size:30))
                                    .foregroundStyle(Color.white)
                                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.black))
                            })
                        }
                    }
                    .padding(.all, 8)
                    .foregroundStyle(Color.white)
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.black))
                }
                let currentPrice = suitablePrices.filter({$0.nominal == Double(selectedNominal)})[0]
                
                let PrimaryItems:[ItemWithNil] = [
                    ItemWithNil(label: "Покупка без сертификата качества ($USD)", value: currentPrice.noCertificateDollars),
                    ItemWithNil(label: "Покупка без сертификата качества (BYN)", value: currentPrice.noCertificateRubles),
                    ItemWithNil(label: "Покупка с сертификатом качества ($USD)", value: currentPrice.certificateDollars),
                    ItemWithNil(label: "Покупка с сертификатом качества (BYN)", value: currentPrice.certificateRubles)
                ]
                
                let SecondaryItems:[ItemWithZero] = [
                    ItemWithZero(label: "Продажа банкам ($USD)", value: currentPrice.banksDollars),
                    ItemWithZero(label: "Продажа банкам (BYN)", value: currentPrice.banksRubles),
                    ItemWithZero(label: "Продажа юр. и физ. лицам ($USD)", value: currentPrice.entitiesDollars),
                    ItemWithZero(label: "Продажа юр. и физ. лицам (BYN)", value: currentPrice.entitiesRubles)
                ]
                List{
                    ForEach(PrimaryItems, id: \.self){item in
                        HStack{
                            Text(item.label)
                                .frame(width:200, height: 75, alignment: .leading)
                            Divider()
                            Spacer()
                            Text(item.value == nil ? "Приостановлена" : String(item.value!))
                        }
                    }
                    
                    ForEach(SecondaryItems, id: \.self){item in
                        HStack{
                            Text(item.label)
                                .frame(width:200, height: 75, alignment: .leading)
                            Divider()
                            Spacer()
                            Text(item.value == 0.0 ? "Приостановлена" : String(item.value))
                        }
                    }
                }
                .listStyle(.plain)
                Spacer()
            }
        }
    }
}
