import Foundation
import PathKit

class WhitelistManager {
    static let whitelistPath = Path("/Users/vanzay/Development/IconsParser/Resources/whitelist.txt")
    static func whitelistArray() -> [String] {
        let whitelistArray = try! whitelistPath.read(.utf8).components(separatedBy: "\n")
        return whitelistArray
    }
    
    static func appendToWhitelist(name: String) {
        // TODO: пустой список порождает сле эн лишний
        var beforeArray = try! whitelistPath.read(.utf8).split(separator: "\n").map{ String($0) } 
        beforeArray.append(name)
        let afterString = Array(
                        Set(
                            beforeArray
                
                        )
        ).sorted().joined(separator: "\n")
        try! whitelistPath.write(afterString)
        
    }
    static func removeFromWhitelist(name: String) {
        var beforeArray = Set(try! whitelistPath.read(.utf8).components(separatedBy: "\n"))
        beforeArray.remove(name)
        let afterString = Array(beforeArray).sorted().joined(separator: "\n")
        try! whitelistPath.write(afterString)
        
    }
    
}
