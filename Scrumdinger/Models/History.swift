//
//  History.swift
//  Scrumdinger
//
//  Created by Hito4TK on 2022/04/05.
//

import Foundation

struct History: Identifiable {
    let id: UUID
    let date: Date
    let attendees: [DailyScrum.Attendee]
    var lengthInMinutes: Int
    
    init(id:UUID = UUID(), date:Date = Date(), attendees:[DailyScrum.Attendee], lengthInMinutes:Int = 5) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
    }
}
