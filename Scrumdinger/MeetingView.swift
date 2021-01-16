//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Evidence Rex Osikhena on 13/01/2021.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    @State private var transript = ""
    @State private var isRecording = false

    var player: AVPlayer { AVPlayer.sharedDingPlayer }
    private let speechRecognizer = SpeechRecognizer()

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.color)
            VStack {
                MeetingHeaderView(secondsElapsed: $scrumTimer.secondsElapsed, secondsRemaining: $scrumTimer.secondsRemaining, scrumColor: scrum.color)
                MeetingTimerView(scrumColor: scrum.color, speakers: $scrumTimer.speakers, isRecording: $isRecording)
                MeetingFooterView(speakers: $scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)

            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }

            speechRecognizer.record(to: $transript)
            isRecording = true
            scrumTimer.startScrum()
        }
        .onDisappear {
            scrumTimer.stopScrum()
            speechRecognizer.stopRecording()
            isRecording = false
            let newHistory = History(attendees: scrum.attendees, lengthOfMinutes: scrumTimer.lengthInMinutes)
            scrum.history.insert(newHistory, at: 0)
        }
    }
}

struct MettingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
    }
}
