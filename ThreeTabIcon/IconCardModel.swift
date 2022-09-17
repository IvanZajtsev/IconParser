import Foundation
struct IconCard: Identifiable {
    var id = UUID().uuidString
    let name: String
    let imageName: String
    let inProject: Bool
}
var iconsCards: [IconCard] = [
    IconCard(name: "First", imageName: "1", inProject: true),
    IconCard(name: "Second", imageName: "2", inProject: false),
    IconCard(name: "Third", imageName: "3", inProject: true),
    ]
