import SwiftUI

struct IconCardView: View {
    var iconCard: IconCard
    var body: some View {
        HStack {
            Image(nsImage: iconCard.nsImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .background(Color.white)
                .cornerRadius(5)
            Text(iconCard.name)
            Spacer()
            Button(action: {}, label: {Text(iconCard.inProject ?  "✅":"❌")})
                
        }
    }
}

struct IconCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
