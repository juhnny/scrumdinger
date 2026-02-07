//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Juhnny Ko on 2/4/26.
//

import SwiftUI
import ThemeKit

struct ThemePicker: View {
    // This binding communicates changes to the theme within the theme picker back to the parent view.
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    // You can use the @Previewable macro on a variable inside a preview to make its views interactive. Previewable variables are useful for prototyping your app’s user interface.
    @Previewable @State var theme: Theme = Theme.periwinkle
    ThemePicker(selection: $theme)
}
