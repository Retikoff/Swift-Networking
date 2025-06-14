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
