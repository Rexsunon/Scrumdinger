//
//  ScrumData.swift
//  Scrumdinger
//
//  Created by Evidence Osikhena on 16/01/2021.
//

import Foundation

class ScrumData: ObservableObject {
    @Published var scrums: [DailyScrum] = []

    private static var documentFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask,
                                            appropriateFor: nil, create: false)
        } catch {
            fatalError("Can't find document directory.")
        }
    }
    
    private static var fileURL: URL {
        return documentFolder.appendingPathComponent("scrum.data")
    }
}
