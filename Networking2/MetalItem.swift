import SwiftUI

struct MetalItem: View{
    let metal: Metal
    
    var body: some View {
        HStack{
            Text(metal.name)
                .bold()
                .font(.system(size: 22))
            Spacer()
            Text(metal.nameBel)
                .italic()
                .font(.system(size:20))
            Spacer()
            Text(metal.nameEng)
                .italic()
                .font(.system(size:20))
        }
        .frame(width: 320)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .padding(2)
        .background(Color.black)
        .cornerRadius(18)
    }
}

#Preview {
    MetalItem(metal: Metal(id: 1, name: "Золото", nameBel: "Золата", nameEng: "Gold"))
}
