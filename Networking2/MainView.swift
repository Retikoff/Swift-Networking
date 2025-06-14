import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View{
        Text("Драгоценные металлы")
            .bold()
            .font(.system(size: 32))
        
        List {
            ForEach(viewModel.metals, id: \.id){metal in
                MetalItem(metal: metal)
                    .onTapGesture{
                        self.viewModel.selectedMetal = metal
                        self.viewModel.showPrices = true
                    }
                    .listRowSeparator(.hidden)
            }
            
        }
        .listStyle(.plain)
    }
}

#Preview {
    MainView().environmentObject(ViewModel())
}
