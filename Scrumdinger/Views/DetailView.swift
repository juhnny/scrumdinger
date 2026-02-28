//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Juhnny Ko on 2/4/26.
//

import SwiftUI
import ThemeKit

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            // Sections create visual distinctions within your list.
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                
            }
            .accessibilityElement(children: .combine)
            HStack {
                Label("Theme", systemImage: "paintpalette")
                Spacer()
                Text(scrum.theme.name)
                    .padding(4)
                    .foregroundColor(scrum.theme.accentColor)
                    .background(scrum.theme.mainColor)
                    .cornerRadius(4)
            }
            Section(header: Text("Attendees")) {
                // 단순한 반복. 아마 아이템 개수가 한정될 때만 사용할 듯.
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            Section(header: Text("History")) {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { history in
                    HStack {
                        Image(systemName: "calendar")
                        Text(history.date, style: .date) // .date style displays the localized string for the date.
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(scrum: $editingScrum, saveEdits: { dailyScrum in
                    // assign the successfully edited scrum back to the DetailView.
                    scrum = editingScrum
                })
                .navigationTitle(scrum.title)
            }
        }
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    
    NavigationStack {
        DetailView(scrum: $scrum)
    }
}
