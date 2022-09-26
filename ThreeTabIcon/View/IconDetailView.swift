import SwiftUI

struct IconDetailView: View {
    @Binding var imageset: Imageset
    var body: some View {
        HStack {
            IconsPreView(imageset: imageset)
            .frame(maxWidth: .infinity)
            
            IconsOptionsView(imageset: $imageset)
            .frame(maxWidth: 300)
            
        }
            .ignoresSafeArea(.all, edges: .all)
    }
}

