import SwiftUI

struct IconCardView: View {
    @Binding var imageset: Imageset
    var body: some View {
        HStack {
            Image(nsImage: imageset.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .cornerRadius(5)
            Text(imageset.name)
            Spacer()
            Button(action: {imageset.inProject = !imageset.inProject}, label: {
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
