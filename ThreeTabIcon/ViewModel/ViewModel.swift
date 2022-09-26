import SwiftUI

class ViewModel: ObservableObject {
    @Published var icons: [Imageset] = IconsLoader.loadImagesets()
    @Published var selectedRecentIcon: String? = IconsLoader.loadIcons().first?.id
}

