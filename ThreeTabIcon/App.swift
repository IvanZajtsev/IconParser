import SwiftUI
@main
struct TestSidebarApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // TODO: мб убивающий что-то коммент
//        .commands {
//            SidebarCommands()
//        }
    }
    
}

struct ContentView: View {
    @StateObject var iconsData = ViewModel()
    var body: some View {
        NavigationView {
            IndoxView()
            Text("No Message Selection")
        }
        .environmentObject(iconsData)
    }
        
}
// TODO: это не вызывается но мб полезно
private func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?
        .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}


struct IndoxView: View {
    @EnvironmentObject var iconsData: ViewModel
    var body: some View {
        List(selection: $iconsData.selectedRecentIcon) {
            ForEach(iconsData.icons) { iconCard in
                NavigationLink(destination:
                                IconDetailView(iconName: iconCard.imageName)
                                
                ) {
                    IconCardView(iconCard: iconCard)
                }
                
                
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Inbox")
        .toolbar {
            Button(action: toggleSidebar) {
                Image(systemName: "sidebar.left")
            }
        }
    }
}

struct SentView: View {
    var body: some View {
        Text("No Sent Messages")
            .navigationTitle("Sent")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                }
            }
    }
}
struct IconDetailView: View {
    let iconName: String
    //let image: Image
    var body: some View {
        HStack {
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
            Spacer()
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
            Spacer()
            //if FileManager.default.fileExists(atPath: "Users/vanzay/Downloads/img-4.png") {
            
            let fileURL = URL(fileURLWithPath: "/Users/vanzay/Downloads/img-4.png")
//                let url = URL(string: "/Users/vanzay/Downloads/img-4.png")!
            let data = try! Data(contentsOf: fileURL)
            //}
            Image(nsImage: NSImage(data: data)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
        }
        
        
        
    }
}

// MARK: -

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
