//
//  LoginView.swift
//  sendit-ios
//
//  Created by Andy on 13/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var errorMessage: String = ""
    @State var isLoading: Bool = false
    @Binding var onSignIn: ((String, String) -> Void)


    var body: some View {
        ZStack {
            Color.fog
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("CHAT")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.ink)
                    .padding(.bottom, 16)
                BodyText(text: "Login to continue")
                    .padding(.bottom, 40)
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(height: 40)
                        .foregroundColor(.white)
                        .shadow(color: Color(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)), radius: 4, x: 0, y: 0)
                    if username.isEmpty {
                        BodyText(text: "Username")
                            .foregroundColor(.lightGray)
                            .padding(.leading, 16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("", text: $username)
                        .frame(height: 40)
                        .padding(.leading, 20)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(.bottom, 24)
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(height: 40)
                        .foregroundColor(.white)
                        .shadow(color: Color(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)), radius: 4, x: 0, y: 0)
                    if password.isEmpty {
                        BodyText(text: "Password")
                            .foregroundColor(.lightGray)
                            .padding(.leading, 16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("", text: $password)
                        .frame(height: 40)
                        .padding(.leading, 20)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(.bottom, 40)
                PrimaryButton(label: self.isLoading ? "Hold on..." : "Login") {
                    if !self.isLoading {
                        self.onSignIn(self.username, self.password)
                    }
                    self.isLoading = true
                }.frame(maxWidth: 235)
                if !errorMessage.isEmpty {
                    BodyText(text: errorMessage)
                        .padding(.top, 16)
                        .foregroundColor(.errorRed)
                }

                Spacer()

                FootnoteText(text: "We only allow signing up through referrals. If you have received a referral, please visit the referral link to complete your sign-up process.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.ink)
                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(onSignIn: .constant({ (username: String, password: String) in
            print("Username: \(username), password: \(password)")
        }))
    }
}
