//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Evidence Rex Osikhena on 13/01/2021.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var isPresented = false
    @State private var data: DailyScrum.Data = DailyScrum.Data()

    var body: some View {
        List {
            Section(header: Text("Meeting info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                        .accessibilityLabel("Start meeting")
                }
                
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
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees, id: \.self) { attendee in
                    Label(attendee, systemImage: "person")
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(scrum.title)
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView(scrumData: $data)
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    },trailing: Button("Done") {
                        isPresented = false
//                        scrum.update(from: data)
                    })
            }
        }
        .navigationBarItems(trailing: Button("Edit") {
            data = scrum.data
            isPresented = true
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static let scrum = DailyScrum.data[0]

    static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(scrum))
        }
    }
}
