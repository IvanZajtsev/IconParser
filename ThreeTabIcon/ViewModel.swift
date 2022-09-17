import SwiftUI

class ViewModel: ObservableObject {
    @Published var icons: [IconCard] = iconsCards
    @Published var selectedRecentIcon: String? = iconsCards.first?.id
}

