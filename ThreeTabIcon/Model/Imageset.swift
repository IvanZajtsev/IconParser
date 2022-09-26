import PathKit
//protocol Imageset {
//    var contentsJsonPath: Path { get set }
//
//}
enum AssetType {
    case pngAsset
    case svgAsset
}
//struct PNGAsset {
//
//}
//
//struct SVGAsset {
//
//}

struct Imageset {
    let path: Path
    var name: String {
        path.lastComponentWithoutExtension
    }
    let assetType: AssetType
    
}
