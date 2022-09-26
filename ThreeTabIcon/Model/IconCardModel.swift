import Foundation
import PathKit
import SwiftUI

struct IconCard: Identifiable {
    var id = UUID().uuidString
    let name: String
    //let imageName: String
    let nsImage: NSImage
    var inProject: Bool
}
