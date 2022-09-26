import SwiftUI

struct IconDetailView: View {
    @Binding var iconCard: IconCard
    var body: some View {
        HStack {
            IconsPreView(iconCard: iconCard)
            .frame(maxWidth: .infinity)
            
            IconsOptionsView(iconCard: $iconCard)
            .frame(maxWidth: 300)
            
        }
            .ignoresSafeArea(.all, edges: .all)
    }
}

