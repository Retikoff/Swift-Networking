//
//  ContentView.swift
//  Networking2
//
//  Created by Student on 24.05.25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        if(viewModel.showPrices){
            PricesView()
        }
        else{
            MainView()
        }
    }
}

#Preview {
    ContentView().environmentObject(ViewModel())
}
