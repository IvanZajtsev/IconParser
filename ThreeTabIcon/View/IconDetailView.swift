import SwiftUI

struct IconDetailView: View {
    let iconCard: IconCard
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 10) {
                HStack(spacing: 10) {
                    Image(nsImage: iconCard.nsImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    Image(nsImage: iconCard.nsImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    Image(nsImage: iconCard.nsImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .background(Color.white)
                        .cornerRadius(10)
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
            .frame(maxWidth: .infinity)
            Spacer()
            VStack(alignment: .center) {
                List {
                    Menu {
                        Button (action: {}, label: {
                            Text("Default")
                        })
                        Button (action: {}, label: {
                            Text("Original Image")
                        })
                        Button (action: {}, label: {
                            Text("Template Image")
                        })
                    } label: {
                        Text("Default")
                    }
                    Menu {
                        Button {
                            //style = 0
                        } label: {
                            Text("Linear")
                            Image(systemName: "arrow.down.right.circle")
                        }
                        Button {
                            //style = 1
                        } label: {
                            Text("Radial")
                            Image(systemName: "arrow.up.and.down.circle")
                        }
                    } label: {
                        Text("Compression")
                    }
                }
                .listStyle(SidebarListStyle())
                .ignoresSafeArea(.all, edges: .all)
            }
            .frame(maxWidth: 250)
            
        }
    }
}
