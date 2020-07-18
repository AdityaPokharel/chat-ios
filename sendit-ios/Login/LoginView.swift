//
//  LoginView.swift
//  sendit-ios
//
//  Created by Andy on 13/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: SessionModel
    @ObservedObject var viewModel = LoginViewModel()

    var body: some View {
        ZStack {
            Color.fog
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text(LoginViewConstants.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.ink)
                    .padding(.bottom, 16)
                BodyText(text: LoginViewConstants.subtitle)
                    .padding(.bottom, 40)
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(height: 40)
                        .foregroundColor(.white)
                        .shadow(color: Color(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)), radius: 4, x: 0, y: 0)
                    if viewModel.email.isEmpty {
                        BodyText(text: LoginViewConstants.usernamePlaceholder)
                            .foregroundColor(.lightGray)
                            .padding(.leading, 16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("", text: $viewModel.email)
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
                    if viewModel.password.isEmpty {
                        BodyText(text: LoginViewConstants.passwordPlaceholder)
                            .foregroundColor(.lightGray)
                            .padding(.leading, 16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    SecureField("", text: $viewModel.password)
                        .frame(height: 40)
                        .padding(.leading, 20)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(.bottom, 40)
                PrimaryButton(label: self.viewModel.isLoading ? LoginViewConstants.buttonLoadingLabel : LoginViewConstants.buttonLabel) {
                    if !self.viewModel.isLoading {
                        self.viewModel.onSignIn(session: self.session)
                    }
                    self.viewModel.isLoading = true
                }.frame(maxWidth: 235)

                if !viewModel.errorMessage.isEmpty {
                    BodyText(text: viewModel.errorMessage)
                        .padding(.top, 16)
                        .foregroundColor(.errorRed)
                        .multilineTextAlignment(.center)
                }

                Spacer()
                FootnoteText(text: LoginViewConstants.footnoteText)
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
        LoginView()
    }
}
