//
//  HeroView.swift
//  LittleLemonIOSCapstone
//
//  Created by XIE CHEN on 2023/06/19.
//

import SwiftUI

struct HeroView: View {
    var body: some View {
        VStack {
            Text("Little Lemon")
                .bold()
                .font(Font.system(size: 36))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.yellow)
            Text("Chicago")
                .bold()
                .foregroundColor(Color.white)
                .font(Font.system(size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack() {
//                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .lineLimit(nil)
//                    .foregroundColor(Color.white)
//                    .background(Color.black)
                VStack {
                    Text("We are a family owned")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(nil)
                        .foregroundColor(Color.white)
                    Text("Mediterranean restaurant,")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(nil)
                        .foregroundColor(Color.white)
                    Text("focused on traditional")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(nil)
                        .foregroundColor(Color.white)
                    Text("recipes served with a")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(nil)
                        .foregroundColor(Color.white)
                    Text("modern twist.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(nil)
                        .foregroundColor(Color.white)
                }
                Image("restauranfood")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 180)
                    .background(Color.green)
                    .clipped()
                    .cornerRadius(15)
            }
        }
        .padding(15)
//        .background(Color(red: 0.57, green: 0.76, blue: 0.69))
        .background(Color(hue: 0.158, saturation: 0.14, brightness: 0.26))
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
