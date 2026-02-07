//
//  CardView.swift
//  Scrumdinger
//
//  Created by Juhnny Ko on 2/4/26.
//

import SwiftUI
import ThemeKit

struct CardView: View {
    let scrum: DailyScrum
    let aa: String = "abc"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(scrum.title.count)", systemImage: "person.3")
                    .accessibilityLabel(Text("\(scrum.title.count) attendees"))
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel(Text("\(scrum.lengthInMinutes) minute meeting"))
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor) // 밝은 색상은 accentColor로 black을, 어두운 색상은 white가 지정돼있음
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 60)) {
    let scrum = DailyScrum.sampleData[0]
    CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
}
