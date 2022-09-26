import SwiftUI

struct IconsOptionsView: View {
    @Binding var imageset: Imageset
    var body: some View {
        VStack(alignment: .center) {
            List {
                HStack {
                    Spacer()
                    Text("Render as")
                        
                    Menu {
                        Button (action: {
                            imageset.contentsJson.renderAs =  "Default"
                            
                        }, label: {
                            Text("Default")
                        })
                        Button (action: {
                            imageset.contentsJson.renderAs =  "Original"
                        }, label: {
                            Text("Original Image")
                        })
                        Button (action: {
                            imageset.contentsJson.renderAs =  "Template"
                        }, label: {
                            Text("Template Image")
                        })
                    } label: {
                        Text(imageset.contentsJson.renderAs)
                            
                    }.frame(width: 180)
                        .id(UUID())
                }
                HStack {
                    Spacer()
                    Text("Compression")
                    Menu {
                        Button {
                            
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
                        .id(UUID())
                }
                HStack {
                    Button(action: {imageset.inProject = !imageset.inProject}, label: {
                        imageset.inProject ? Text("❌") : Text("⬇️")
                    })
                    Text("\(imageset.inProject ? "✅ In project" : "🟥 Not in project") ")
                }
                
            }
            .listStyle(SidebarListStyle())
            .ignoresSafeArea(.all, edges: .all)
        }
    }
}
