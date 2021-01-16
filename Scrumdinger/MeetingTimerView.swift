//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Evidence Osikhena on 16/01/2021.
//

import SwiftUI

struct MeetingTimerView: View {
    var scrumColor: Color
    @Binding var speakers: [ScrumTimer.Speaker]

    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
            VStack {
                Text(currectSpeaker)
                    .font(.title)
                Text("is speaking")
            }
            .accessibilityElement(children: .combine)
            .foregroundColor(scrumColor.accessibleFontColor)
        }
        .padding(.horizontal)
        
    }
    
    private var currectSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    @State static var speakers = [ScrumTimer.Speaker(name: "Rex", isCompleted: true), ScrumTimer.Speaker(name: "Jide", isCompleted: false)]
    static var previews: some View {
        MeetingTimerView(scrumColor: Color("Dsign"), speakers: $speakers)
    }
}
