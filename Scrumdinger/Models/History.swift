//
//  History.swift
//  Scrumdinger
//
//  Created by Juhnny Ko on 2/28/26.
//

import Foundation

// The History structure has properties for storing the essential details of a scrum session: the date of the meeting and a list of attendees.
struct History: Identifiable {
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
