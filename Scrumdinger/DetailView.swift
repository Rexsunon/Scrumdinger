//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Evidence Osikhena on 13/01/2021.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let scrum = DailyScrum.data[0]

    static var previews: some View {
        NavigationView {
            DetailView(scrum: scrum)
        }
    }
}
