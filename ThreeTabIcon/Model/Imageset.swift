import PathKit
import AppKit
protocol ImagesetProtocol: Identifiable {
    // TODO: почему нелья let??? что здесь нахрен вычислимое
    var image: NSImage { get set }
    var name: String { get set }
    var inProject: Bool { get set}
}
enum AssetType {
    case pngAsset
    case svgAsset
}


struct PNGAsset: ImagesetProtocol {
    var id = UUID().uuidString
    
    var name: String
    var image: NSImage
    var image2x: NSImage
    var image3x: NSImage
    var inProject: Bool

}
struct SVGAsset: ImagesetProtocol {
    var id = UUID().uuidString
    var name: String
    var image: NSImage
    var inProject: Bool
    
}

struct Imageset: Identifiable {
    let id = UUID().uuidString
    var contentsJson: ContentsJson = ContentsJson()
    let name: String
    let image: NSImage
    let image2x: NSImage?
    let image3x: NSImage?
    var inProject: Bool
    let assetType: AssetType
    
}

struct ContentsJson {
    var renderAs: String = "Default"
}

class ImagesetManager {
    static func smth() {
        
    }
}
