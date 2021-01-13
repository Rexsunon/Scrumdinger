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
        List {
            Section(header: Text("Meeting info")) {
                Label("Start Meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .accessibilityLabel("Start meeting")
                
                HStack {
                    Label("Length", systemImage: "clock")
                        .accessibilityLabel("Meeting length")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                
                HStack {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                }
                .accessibilityElement(children: .ignore)
            }
        }
        .listStyle(InsetGroupedListStyle())
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
