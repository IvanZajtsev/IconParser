import SwiftUI

struct ContentView: View {
    @StateObject var iconsData = ViewModel()
    var body: some View {
        NavigationView {
            IconsListView()
            Text("No Message Selection")
            
        }
        .environmentObject(iconsData)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
