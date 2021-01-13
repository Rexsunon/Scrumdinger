//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Evidence Rex Osikhena on 13/01/2021.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.data)
            }
        }
    }
}
