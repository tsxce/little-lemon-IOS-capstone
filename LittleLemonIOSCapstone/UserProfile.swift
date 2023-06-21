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
    
    @State private var isChecked1 = true
    @State private var isChecked2 = true
    @State private var isChecked3 = true
    @State private var isChecked4 = true
    var body: some View {
        ScrollView {
            VStack {
                HeaderView()
                VStack {
                    Text("Personal information")
                        .bold()
                        .font(.system(size: 22))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                        .frame(height: 10)
                    VStack {
                        Text("Avatar")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Image("profile-image-placeholder")
                                .resizable()
                                .frame(width: 100, height:100)
                                .clipShape(Circle())
                            Button(action: {
                                
                            }, label: {
                                Text("Change")
                            })
                                .padding(.init(top: 20, leading: 20, bottom: 20, trailing: 20))
                                .foregroundColor(.white)
                                .background(Color(hue: 0.158, saturation: 0.14, brightness: 0.26))
                                .cornerRadius(10)
                            Button(action: {
                                
                            }, label: {
                                Text("Remove")
                            })
                                .padding(.init(top: 20, leading: 30, bottom: 20, trailing: 30))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(.gray, lineWidth: 2)
                                )
                        }
                        VStack {
                            VStack{
                                Text("First name")
                                    .font(.system(size: 16))
                                    .font(.subheadline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text(email ?? "")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.gray, lineWidth: 2)
                                    )
                            }
                            Spacer()
                                .frame(height:25)
                            VStack{
                                Text("Last name")
                                    .font(.system(size: 16))
                                    .font(.subheadline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text(email ?? "")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.gray, lineWidth: 2)
                                    )
                            }
                            Spacer()
                                .frame(height:25)
                            VStack{
                                Text("email")
                                    .font(.system(size: 16))
                                    .font(.subheadline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text(email ?? "")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.gray, lineWidth: 2)
                                    )
                            }
                            Spacer()
                                .frame(height:25)
                        }
                    }
                    Text("Email notifications")
                        .bold()
                        .font(.system(size: 22))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                        .frame(height: 10)
                    VStack {
                        Toggle(isOn: $isChecked1) {
                            Text("Order statuses")
                        }
                    }
                    .padding(2)
                    VStack {
                        Toggle(isOn: $isChecked2) {
                            Text("Password changes")
                        }
                    }
                    .padding(2)
                    VStack {
                        Toggle(isOn: $isChecked3) {
                            Text("Special offers")
                        }
                    }
                    .padding(2)
                    VStack {
                        Toggle(isOn: $isChecked4) {
                            Text("News letter")
                        }
                    }
                    .padding(2)
    //                Text(firstName ?? "")
    //                Text(lastName ?? "")
    //                Text(email ?? "")
                    Button(action: {
                        handleClick()
                    }, label: {
                        Text("Log out")
                    })
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.init(top: 10, leading: 30, bottom: 10, trailing: 30))
                    .foregroundColor(.black)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .padding(.top, 10)
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                )
            }
            .padding(10)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
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
