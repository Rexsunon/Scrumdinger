//
//  History.swift
//  Scrumdinger
//
//  Created by Evidence Rex Osikhena on 15/01/2021.
//

import Foundation

struct History: Identifiable, Codable {
    var id: UUID
    var date: Date
    var attendees: [String]
    var lengthInMinutes: Int
    var transcript: String?
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [String], lengthInMinutes: Int, transcript: String? = nil) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.transcript = transcript
    }
}
