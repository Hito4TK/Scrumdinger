//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Hito4TK on 2022/04/02.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(theme.mainColor)
            //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Label(theme.name, systemImage: "paintpalette")
                .padding(4)
        }
        .foregroundColor(theme.accentColor)
        .fixedSize(horizontal: false, vertical: true)

    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .buttercup)
    }
}
