import Foundation
struct IconCard: Identifiable {
    var id = UUID().uuidString
    let name: String
    let imageName: String
    let inProject: Bool
}
var iconsCards: [IconCard] = [
    IconCard(name: "cake_circle_fill_raspberry_pink_32", imageName: "4", inProject: true),
    IconCard(name: "gift_32", imageName: "5", inProject: false),
    IconCard(name: "money_transfer_outline_32", imageName: "6", inProject: true),
    ]
