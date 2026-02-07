//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Juhnny Ko on 2/4/26.
//

import SwiftUI

struct DetailEditView: View {
//    @State private var scrum = DailyScrum.emptyScrum
    @Binding var scrum: DailyScrum
    @State private var attendeeName = ""
    
    var body: some View {
        // The Form container automatically adapts the appearance of controls when it renders on different platforms. 라고 하는데 무슨 말이지?
        Form {
            Section(header: Text("Meeting Info")) {
                //  use the $ syntax to create a binding to scrum.title
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length") // 보여지진 않음. accessibility 용도
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true) // VoiceOver에 불필요한 정보는 숨김
                }
                // pass State to Binding
                ThemePicker(selection: $scrum.theme)

            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                // The framework calls the closure you pass to onDelete when the user swipes to delete a row.
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                    
                }
                HStack {
                    TextField("New Attendee", text: $attendeeName)
                    Button(action: {
                        withAnimation {
                            let newAttendee = DailyScrum.Attendee(name: attendeeName)
                            scrum.attendees.append(newAttendee)
                            attendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(attendeeName.isEmpty)
                }
            }
        }
        
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    DetailEditView(scrum: $scrum)
}
