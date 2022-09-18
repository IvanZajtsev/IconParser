import Foundation
import PathKit
import SwiftUI

struct IconCard: Identifiable {
    var id = UUID().uuidString
    let name: String
    //let imageName: String
    let nsImage: NSImage
    let inProject: Bool
}
var iconsCards: [IconCard] = IconsLoader.loadIcons()
/*
var iconsCards: [IconCard] = [
    IconCard(name: "cake_circle_fill_raspberry_pink_32", nsImage: <#T##NSImage#>, inProject: true),
    IconCard(name: "gift_32", imageName: "5", inProject: false),
    IconCard(name: "money_transfer_outline_32", imageName: "6", inProject: true),
    IconCard(name: "play_32", imageName: "7", inProject: true),
    ]
 */
// /Users/vanzay/Downloads/icons-master/src/svg


//                let fileURL = URL(fileURLWithPath: "/Users/vanzay/Downloads/img-4.png")
//                let data = try! Data(contentsOf: fileURL)
//                Image(nsImage: NSImage(data: data)!)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                .frame(width: 120, height: 120)

struct IconsLoader {
    let field: String
    
    static func loadIcons()  -> [IconCard] {
        //let svgFolderPath: PathKit.Path = Path("/Users/vanzay/Downloads/icons-master/src/svg")
        //let jpgFolderPath: PathKit.Path = Path("/Users/vanzay/Development/TestJPGs")
        let iconsFolderPath: PathKit.Path = Path("/Users/vanzay/Development/DownloadedIcons")
        let iconsPathArray = try! iconsFolderPath.recursiveChildren().filter{ $0.extension == "png" }
        // TODO: try! обработка ошибок сделать 
        //let nsImagesArray = iconsPathArray.map{ NSImage(data: try! Data(contentsOf: URL(string: $0.string)!))  }
        let iconsCardsArray = iconsPathArray.map{ IconCard(name: $0.lastComponentWithoutExtension,
                                                           nsImage: NSImage(data: try! Data(contentsOf: URL(fileURLWithPath:  $0.string)))!,
                                                           inProject: false) }
        return iconsCardsArray
    }
}
