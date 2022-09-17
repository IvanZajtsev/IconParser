import SwiftUI

struct IconCardView: View {
    var iconCard: IconCard
    var body: some View {
        HStack {
            Image(iconCard.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
            Text(iconCard.name)
            Button(action: {}, label: {Text(iconCard.inProject ?  "✅":"❌")})
                
        }
    }
}

struct IconCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
