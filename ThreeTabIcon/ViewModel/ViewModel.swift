import SwiftUI

class ViewModel: ObservableObject {
    @Published var icons: [IconCard] = IconsLoader.loadIcons()
    @Published var selectedRecentIcon: String? = IconsLoader.loadIcons().first?.id
}

