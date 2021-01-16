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

struct SpeakerArc: Shape {
    let speakerIndex: Int
    let totalSpeakers: Int

    private var degreePerSpeaker: Double {
        360.0 / Double(totalSpeakers)
    }

    private var startAngle: Angle {
        Angle(degrees: degreePerSpeaker * Double(speakerIndex) + 1.0)
    }

    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreePerSpeaker - 1.0)
    }

    func path(in rect: CGRect) -> Path {
        let diamiter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diamiter / 2.0
        let center = CGPoint(x: rect.origin.x + rect.size.width / 2.0, y: rect.origin.y + rect.size.height / 2.0)

        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    @State static var speakers = [ScrumTimer.Speaker(name: "Rex", isCompleted: true), ScrumTimer.Speaker(name: "Jide", isCompleted: false)]
    static var previews: some View {
        MeetingTimerView(scrumColor: Color("Dsign"), speakers: $speakers)
    }
}
