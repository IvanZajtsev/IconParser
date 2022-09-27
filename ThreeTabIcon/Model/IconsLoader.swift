import PathKit
import Foundation
import SwiftUI

struct IconsLoader {
    //let field: String
    
    static func loadIcons()  -> [IconCard] {
        
        let iconsFolderPath: PathKit.Path = Path("/Users/vanzay/Development/DownloadedIcons")
        let iconsPathArray = try! iconsFolderPath.recursiveChildren().filter{ $0.extension == "png" }
        // TODO: try! обработка ошибок сделать
        let iconsCardsArray = iconsPathArray.map{ IconCard(name: $0.lastComponentWithoutExtension,
                                                           nsImage: NSImage(data: try! Data(contentsOf: URL(fileURLWithPath:  $0.string)))!,
                                                           inProject: false) }
        return iconsCardsArray
    }
    static func loadRepoImagesets()  -> [Imageset] {
        
        let whitelistArray = try! Path("/Users/vanzay/Development/IconsParser/Resources/whitelist.txt").read(.utf8).components(separatedBy: "\n")
        var imagesetsArray: [Imageset] = []
        let cachesPath: PathKit.Path = Path("/Users/vanzay/Development/IconsParser/Caches")
        let pngPath = try! cachesPath.children().filter({ $0.lastComponent == "png" }).first!
        print(pngPath)
        let svgPath = try! cachesPath.children().filter({ $0.lastComponent == "svg" }).first!
        // TODO: тут будет иной поиск картинко, здесь для примера сделаю
        for folderPath in try! pngPath.children().filter({ $0.isDirectory }) {
            
            let iconsPaths = try! folderPath.children()
            let image1xPath = iconsPaths.filter({ $0.lastComponentWithoutExtension.contains("@1x") }).first
            let image2xPath = iconsPaths.filter({ $0.lastComponentWithoutExtension.contains("@2x") }).first
            let image3xPath = iconsPaths.filter({ $0.lastComponentWithoutExtension.contains("@3x") }).first
            
            // TODO: по дефолту для проверки повесить НЕ пустое изобраджение
            let image1x = image1xPath != nil ? NSImage(data: try! Data(contentsOf: URL(fileURLWithPath: image1xPath!.string)))! : NSImage()
            let image2x = image2xPath != nil ? NSImage(data: try! Data(contentsOf: URL(fileURLWithPath: image2xPath!.string)))! : NSImage()
            let image3x = image3xPath != nil ? NSImage(data: try! Data(contentsOf: URL(fileURLWithPath: image3xPath!.string)))! : NSImage()
            
            
            let imageset = Imageset(name: folderPath.lastComponentWithoutExtension,
                                    image: image1x,
                                    image2x: image2x,
                                    image3x: image3x,
                                    inProject: whitelistArray.contains(folderPath.lastComponentWithoutExtension),
                                    assetType: .pngAsset)
            imagesetsArray.append(imageset)
        }
        
        for folderPath in try! svgPath.children().filter({ $0.isDirectory }) {
            let imagePath = try! folderPath.children().filter({ $0.extension == "svg" }).first
            if let imagePath = imagePath {
                // svg2png -w 72 -h 72 \(imagePath) \(imagePath.string.dropLast(3) + "png")
                let output = ShellManager.shell("svg2png\\ -w\\ 72\\ -h\\ 72\\ \(imagePath)\\ \(imagePath.string.dropLast(3) + "png")")
                print(output)
            }
            let helperPngPath = try! folderPath.children().filter({ $0.extension == "png" }).first
            let image = imagePath != nil ? NSImage(data: try! Data(contentsOf: URL(fileURLWithPath: helperPngPath!.string)))! : NSImage()
            let imageset = Imageset(name: folderPath.lastComponentWithoutExtension,
                                    image: image,
                                    image2x: nil,
                                    image3x: nil,
                                    inProject: whitelistArray.contains(folderPath.lastComponentWithoutExtension),
                                    assetType: .svgAsset)
            imagesetsArray.append(imageset)
        }
        return imagesetsArray
        
    }
    
    
    
    static func loadImagesets()  -> [Imageset] {
        
        let assetsPath: PathKit.Path = Path("/Users/vanzay/Development/Assets.xcassets")
        let imagesetsPathArray = try! assetsPath.children().filter({ $0.extension == "imageset" })
        var imagesetsArray: [Imageset] = []
        for path in imagesetsPathArray {
            let assetType: AssetType
            let iconsPaths = try! path.children()
            // TODO: переделать развилку на свг и пнг тип: надо не отрицание отдного на другое, а четкий поиск svg в папке и пнг в папке и ошибку если кто-то лишний
            if iconsPaths.filter({ $0.extension == "svg" }).isEmpty {
                assetType = .pngAsset
            } else {
                assetType = .svgAsset
            }
            let imageset: Imageset
            switch assetType {
            case .pngAsset:
                //TODO: блять на гитлабе другая структураааа там 5 размеров не подписанных
                let image1xPath = iconsPaths.filter({ $0.lastComponentWithoutExtension.contains("@1x") }).first
                let image2xPath = iconsPaths.filter({ $0.lastComponentWithoutExtension.contains("@2x") }).first
                let image3xPath = iconsPaths.filter({ $0.lastComponentWithoutExtension.contains("@3x") }).first
                
                // TODO: по дефолту для проверки повесить НЕ пустое изобраджение
                let image1x = image1xPath != nil ? NSImage(data: try! Data(contentsOf: URL(fileURLWithPath: image1xPath!.string)))! : NSImage()
                let image2x = image2xPath != nil ? NSImage(data: try! Data(contentsOf: URL(fileURLWithPath: image2xPath!.string)))! : NSImage()
                let image3x = image3xPath != nil ? NSImage(data: try! Data(contentsOf: URL(fileURLWithPath: image3xPath!.string)))! : NSImage()
                
                
                imageset = Imageset(name: path.lastComponentWithoutExtension,
                                    image: image1x,
                                    image2x: image2x,
                                    image3x: image3x,
                                    inProject: false,
                                    assetType: .pngAsset)
            case .svgAsset:
                let imagePath = iconsPaths.filter({ $0.extension == "svg" }).first
                if let imagePath = imagePath {
                    // svg2png -w 72 -h 72 \(imagePath) \(imagePath.string.dropLast(3) + "png")
                    let output = ShellManager.shell("svg2png\\ -w\\ 72\\ -h\\ 72\\ \(imagePath)\\ \(imagePath.string.dropLast(3) + "png")")
                    print(output)
                }
                let helperPngPath = iconsPaths.filter({ $0.extension == "png" }).first
                let image = imagePath != nil ? NSImage(data: try! Data(contentsOf: URL(fileURLWithPath: helperPngPath!.string)))! : NSImage()
                imageset = Imageset(name: path.lastComponentWithoutExtension,
                                    image: image,
                                    image2x: nil,
                                    image3x: nil,
                                    inProject: false,
                                    assetType: .svgAsset)
            }
            
            imagesetsArray.append(imageset)
        }
        
        
        return imagesetsArray
    }
}

// открылось приложение, скачались полностью 2 репы
// как понять кто уже есть в проекте -- сравнить с вайтлистом. СОГЛАСУЯ ФОРМАТЫ! если есть старая пнг, то она НЕ похожа на такую
// же по имени свг. это важно!


//let svgFolderPath: PathKit.Path = Path("/Users/vanzay/Downloads/icons-master/src/svg")
//let jpgFolderPath: PathKit.Path = Path("/Users/vanzay/Development/TestJPGs")
/*
 let assetsPath: PathKit.Path = Path("/Users/vanzay/Development/Assets.xcassets")
 let imagesetPathArray = try! assetsPath.children().filter{ $0.extension == "imageset" }
 let iconsPathArray = try! assetsPath.children().filter{ $0.extension == "png" }
 */
//let nsImagesArray = iconsPathArray.map{ NSImage(data: try! Data(contentsOf: URL(string: $0.string)!))  }
