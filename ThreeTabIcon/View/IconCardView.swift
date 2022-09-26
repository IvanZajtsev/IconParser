import SwiftUI

struct IconCardView: View {
    @Binding var iconCard: IconCard
    var body: some View {
        HStack {
            Image(nsImage: iconCard.nsImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .cornerRadius(5)
            Text(iconCard.name)
            Spacer()
            Button(action: {iconCard.inProject = !iconCard.inProject}, label: {
                Image(systemName: iconCard.inProject ? "checkmark.square" : "square")
                    .font(.system(size: 36))
                    .foregroundColor(iconCard.inProject ? .green : .red)
                    
                
            })
                .buttonStyle(.borderless)
                
                
                
                
        }
    }
}

struct IconCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
