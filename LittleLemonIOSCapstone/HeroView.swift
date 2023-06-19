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
                .padding([.leading, .trailing], 20)
//                .padding([.top, .bottom], 8)
                .font(Font.system(size: 36))
//                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.yellow)
            Text("Chicago")
                .bold()
                .foregroundColor(Color.white)
                .font(Font.system(size: 24))
                .padding([.leading, .trailing], 20)
                .padding(.top, 0)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .foregroundColor(Color.white)
                Image("restauranfood")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .frame(width: 128, height: 280)
            }
            .padding([.top, .bottom], 0)
        }
        .background(Color.mint)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
