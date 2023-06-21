//
//  HeaderView.swift
//  LittleLemonIOSCapstone
//
//  Created by XIE CHEN on 2023/06/19.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            Image("littleLemon")
            Image("profile-image-placeholder")
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height:50)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: .infinity)
        .padding([.leading, .trailing], 10)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
