//
//  IconsPreView.swift
//  ThreeTabIcon
//
//  Created by Иван Зайцев on 23.09.2022.
//

import SwiftUI

enum AssetType {
    case PNGAsset
    case SVGAsset
}

struct IconsPreView: View {
    let iconCard: IconCard
    var body: some View {
        VStack(spacing: 5) {
            Spacer().frame(height: 60)
            HStack{
                Spacer().frame(width: 10)
                Text(" \(iconCard.name) ")
                
                    .font(.system(size: 20)).bold()
                    .background(Color(.sRGB, white: 0.4, opacity: 1))
                    .cornerRadius(5)
                Spacer()
            }
            VStack {
                HStack(spacing: 15) {
                    VStack {
                        Image(nsImage: iconCard.nsImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)
                        Text("1x")
                        
                    }
                    VStack {
                        Image(nsImage: iconCard.nsImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)
                        Text("2x")
                        
                    }
                    VStack {
                        Image(nsImage: iconCard.nsImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)
                        Text("3x")
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity)
                Spacer().frame(width: 500, height: 1).background(Color(.sRGB, white: 1, opacity: 0.15))
                Spacer().frame(height: 20)
                Text("Universal")
                Spacer().frame(height: 20)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color(.sRGB, white: 1, opacity: 0.15), lineWidth: 1)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
            )
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color(.sRGB, white: 0.25, opacity: 1))
        //
        
    }
}

//struct IconsPreView_Previews: PreviewProvider {
//    static var previews: some View {
//        IconsPreView()
//    }
//}
