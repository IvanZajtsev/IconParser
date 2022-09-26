import SwiftUI

struct IconsListView: View {
    @EnvironmentObject var iconsData: ViewModel
    var body: some View {
        List(selection: $iconsData.selectedRecentIcon) {
            ForEach($iconsData.icons) { imageset in
                NavigationLink(destination:
                                IconDetailView(imageset: imageset)
                               
                ) {
                    IconCardView(imageset: imageset)
                }
            }
        }
        //.listStyle(SidebarListStyle())
        .toolbar {
            Button(action: toggleSidebar) {
                Image(systemName: "sidebar.left")
            }
        }
    }
}

private func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?
        .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}
