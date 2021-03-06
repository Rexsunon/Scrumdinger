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
    @Binding var isRecording: Bool

    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
            VStack {
                Text(currectSpeaker)
                    .font(.title)
                Text("is speaking")
                
                Image(systemName: isRecording ? "mic" : "mic.slash")
                    .padding(.top)
                    .font(.title)
                    .accessibilityLabel(isRecording ? "With transcription" : "Without transcription")
            }
            .accessibilityElement(children: .combine)
            .foregroundColor(scrumColor.accessibleFontColor)

            ForEach(speakers) { speaker in
                if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                    SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                        .rotation(Angle(degrees: -90))
                        .stroke(scrumColor, lineWidth: 12)
                }
            }
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
        MeetingTimerView(scrumColor: Color("Design"), speakers: $speakers, isRecording: .constant(true))
    }
}
