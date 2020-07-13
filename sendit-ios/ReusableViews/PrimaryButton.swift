//
//  PrimaryButton.swift
//  sendit-ios
//
//  Created by Andy on 13/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import SwiftUI

struct PrimaryButton: View {
    var label: String
    var action: () -> Void

    var body: some View {
        Button(action: { self.action() }) {
            Text(self.label)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 48, alignment: .center)
                .background(Color.actionPurple)
                .cornerRadius(48)
                .shadow(color: Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)), radius: 6, x: 0, y: 0)
                
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(label: "Press me!") {
            print("Hello world")
        }
    }
}
