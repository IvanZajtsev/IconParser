import SwiftUI

struct IconsOptionsView: View {
    let iconCard: IconCard
    var body: some View {
        VStack(alignment: .center) {
            List {
                HStack {
                    Spacer()
                    Text("Render as")
                        
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
                            
                    }.frame(width: 180)
                }
                HStack {
                    Spacer()
                    Text("Compression")
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
                    }.frame(width: 180)
                }
                Text("\(iconCard.inProject ? "✅ In project" : "🟥 Not in project") ")
            }
            .listStyle(SidebarListStyle())
            .ignoresSafeArea(.all, edges: .all)
        }
    }
}
