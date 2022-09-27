import SwiftUI

class ViewModel: ObservableObject {
    @Published var icons: [Imageset] = IconsLoader.loadRepoImagesets()
    @Published var selectedRecentIcon: String? = IconsLoader.loadIcons().first?.id
}

