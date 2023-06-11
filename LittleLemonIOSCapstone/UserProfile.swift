//
//  UserProfile.swift
//  LittleLemonIOSCapstone
//
//  Created by XIE CHEN on 2023/06/11.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    var firstName = UserDefaults.standard.string(forKey: "kFirstName")
    var lastName = UserDefaults.standard.string(forKey: "kLastName")
    var email = UserDefaults.standard.string(forKey: "kEmail")
    let kIsLoggedIn = UserDefaults.standard.string(forKey: "kIsLoggedIn")
    var body: some View {
        VStack {
            Text("Personal information")
            Image("profile-image-placeholder")
                .resizable()
                .frame(width: 140, height:240)
            Text(firstName ?? "")
            Text(lastName ?? "")
            Text(email ?? "")
            Button(action: {
                handleClick()
            }, label: {
                Text("Log out")
            })
            .padding(.init(top: 10, leading: 30, bottom: 10, trailing: 30))
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(20)
            .padding(.top, 10)
        }
    }
    func handleClick() {
        UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
        self.presentation.wrappedValue.dismiss()
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
