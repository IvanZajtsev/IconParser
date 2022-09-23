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

struct IconsLoader {
    let field: String
    
    static func loadIcons()  -> [IconCard] {
        //let svgFolderPath: PathKit.Path = Path("/Users/vanzay/Downloads/icons-master/src/svg")
        //let jpgFolderPath: PathKit.Path = Path("/Users/vanzay/Development/TestJPGs")
        let iconsFolderPath: PathKit.Path = Path("/Users/vanzay/Development/DownloadedIcons")
        let iconsPathArray = try! iconsFolderPath.recursiveChildren().filter{ $0.extension == "png" }
        /*
         let assetsPath: PathKit.Path = Path("/Users/vanzay/Development/Assets.xcassets")
         let imagesetPathArray = try! assetsPath.children().filter{ $0.extension == "imageset" }
         let iconsPathArray = try! assetsPath.children().filter{ $0.extension == "png" }
         */
        // TODO: try! обработка ошибок сделать
        //let nsImagesArray = iconsPathArray.map{ NSImage(data: try! Data(contentsOf: URL(string: $0.string)!))  }
        let iconsCardsArray = iconsPathArray.map{ IconCard(name: $0.lastComponentWithoutExtension,
                                                           nsImage: NSImage(data: try! Data(contentsOf: URL(fileURLWithPath:  $0.string)))!,
                                                           inProject: false) }
        return iconsCardsArray
    }
}
