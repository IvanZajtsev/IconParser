import SwiftUI

struct IconDetailView: View {
    let iconCard: IconCard
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Image(iconCard.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                
                Image(iconCard.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                
                
                Image(iconCard.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
//                let fileURL = URL(fileURLWithPath: "/Users/vanzay/Downloads/img-4.png")
//                let data = try! Data(contentsOf: fileURL)
//                Image(nsImage: NSImage(data: data)!)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                .frame(width: 120, height: 120)
                
            }
            
            Text(iconCard.name)
            Spacer()
        }
        
        
        
    }
}
