import SwiftUI
@main
struct TestSidebarApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        // TODO: мб убивающий что-то коммент
//        .commands {
//            SidebarCommands()
//        }
    }
}

