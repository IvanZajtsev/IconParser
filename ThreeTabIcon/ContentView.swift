import SwiftUI

struct ContentView: View {
    @StateObject var iconsData = ViewModel()
    var body: some View {
        NavigationView {
            IconsView()
            Text("No Message Selection")
        }
        .environmentObject(iconsData)
    }
        
}
