//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Juhnny Ko on 2/4/26.
//

import SwiftUI
import ThemeKit

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                ProgressView(value: 5, total: 15)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Seconds Elapsed")
                            .font(.caption)
                        // The image uses one of the included SF Symbols. The system treats these symbols like fonts, so they scale dynamically with a user’s device settings.
                        Label("300", systemImage: "hourglass.tophalf.fill")
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Seconds Remaining")
                            .font(.caption)
                        Label("600", systemImage: "hourglass.bottomhalf.fill")
                    }

                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Time remaining")
                .accessibilityValue("10 minutes")
                Circle()
                    .strokeBorder(lineWidth: 24)
                HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speacker")
                }
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    
    MeetingView(scrum: $scrum)
}
