//
//  Home.swift
//  LittleLemonIOSCapstone
//
//  Created by XIE CHEN on 2023/06/10.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            Menu()
                .tabItem({
                    Label("Menu", systemImage: "list.dash")
                })
            
            Text("This is the Trash View")
                .tabItem({
                    Label("", systemImage: "trash")
                })
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
