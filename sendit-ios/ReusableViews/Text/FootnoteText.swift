//
//  FootnoteText.swift
//  sendit-ios
//
//  Created by Andy on 13/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import SwiftUI

struct FootnoteText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.system(.footnote, design: .rounded))
    }
}

struct FootnoteText_Previews: PreviewProvider {
    static var previews: some View {
        BodyText(text: "Hello, world!")
    }
}
