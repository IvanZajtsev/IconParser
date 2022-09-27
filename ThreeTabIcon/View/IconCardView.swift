import SwiftUI

struct IconCardView: View {
    @Binding var imageset: Imageset
    var body: some View {
        HStack {
            Image(nsImage: imageset.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .background(Color.gray)
                .cornerRadius(5)
            Text(imageset.name)
            Spacer()
            Button(action: {
                imageset.inProject = !imageset.inProject
                imageset.inProject ? WhitelistManager.appendToWhitelist(name: imageset.name) : WhitelistManager.removeFromWhitelist(name: imageset.name)
                
            }, label: {
                Image(systemName: imageset.inProject ? "checkmark.square" : "square")
                    .font(.system(size: 36))
                    .foregroundColor(imageset.inProject ? .green : .red)
                    
                
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
