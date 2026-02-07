//
//  Scrums.swift
//  Scrumdinger
//
//  Created by Juhnny Ko on 2/4/26.
//

import SwiftUI
import ThemeKit

struct ScrumView: View {
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            // id로 유니크한 값을 제공해주기 위해 Identifiable 프로토콜 제공. 각 아이템에 이미 유니크한 id가 주어져 있으면 불필요
            //List(scrums, id: \.title) { scrum in
            List($scrums) { $scrum in
                // The destination presents a single view in the navigation hierarchy when a user interacts with the element.
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle(Text("Daily Scrums"))
            .toolbar {
                Button(action: {}){
                    Image(systemName: "plus")
                }
                .accessibilityLabel(Text("New Scrum"))
            }

        }
    }
}

#Preview {
    @Previewable @State var scrums: [DailyScrum] = DailyScrum.sampleData
    
    ScrumView(scrums: $scrums)
}
