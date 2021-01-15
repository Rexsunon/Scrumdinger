//
//  History.swift
//  Scrumdinger
//
//  Created by Evidence Rex Osikhena on 15/01/2021.
//

import Foundation

struct History: Identifiable {
    var id: UUID
    var date: Date
    var attendees: [String]
    var lengthOfMinutes: Int
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [String], lengthOfMinutes: Int) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthOfMinutes = lengthOfMinutes
    }
}
