//
//  Onboarding.swift
//  LittleLemonIOSCapstone
//
//  Created by XIE CHEN on 2023/06/10.
//

import SwiftUI

struct Onboarding: View {
    @State var isLoggedIn = false
    let kFirstName = "first name key"
    let kLastName = "last name key"
    let kEmail = "email key"
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
//    @State var showFormInvalidMessage = false
//    @State var errorMessage = ""
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                HStack{
                    Text("NAME: ")
                        .font(.subheadline)
                    TextField("Your first name...",
                              text: $firstName)
                    
                }
                HStack{
                    Text("PHONE: ")
                        .font(.subheadline)
                    
                    TextField("Your last name...",
                              text: $lastName)
                    .textContentType(.telephoneNumber)
                    .keyboardType(.phonePad)
                }
                HStack{
                    Text("E-MAIL: ")
                        .font(.subheadline)
                    TextField("Your e-mail...",
                              text: $email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                }
                
                Button(action: {
                    validateFunc()
                }, label: {
                    Text("Register")
                })
                .padding(.init(top: 10, leading: 30, bottom: 10, trailing: 30))
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(20)
                .padding(.top, 10)
            }
        }
    }
    
    private func validateFunc() {
//        var invalidFirstNameMessage = ""
//        if(firstName.isEmpty) {
//            invalidFirstNameMessage = "First names can only contain letters and must have at least 3 characters\n\n"
//        }
//        var invalidLastNameMessage = ""
//        if(lastName.isEmpty) {
//            invalidLastNameMessage = "Last names can only contain letters and must have at least 3 characters\n\n"
//        }
//        var invalidEmailMessage = ""
//        if(lastName.isEmpty) {
//            invalidEmailMessage = "Email can only contain letters and must have at least 3 characters\n\n"
//        }
//        self.errorMessage = "Found these errors in the form:\n\n \(invalidFirstNameMessage)\(invalidLastNameMessage)\(invalidEmailMessage)"
//
//        showFormInvalidMessage.toggle()
        
        
        var invalidFirstNameMessage = ""
        if(firstName.isEmpty || lastName.isEmpty || lastName.isEmpty) {
            invalidFirstNameMessage = "First names can only contain letters and must have at least 3 characters\n\n"
        } else {
            UserDefaults.standard.set(firstName, forKey: kFirstName)
            UserDefaults.standard.set(lastName, forKey: kLastName)
            UserDefaults.standard.set(email, forKey: kEmail)
            isLoggedIn = true
        }
        return
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
