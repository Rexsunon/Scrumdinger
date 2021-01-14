//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Evidence Rex Osikhena on 14/01/2021.
//

import SwiftUI

struct MeetingHeaderView: View {
    @Binding var secondsElaped: Int
    @Binding var secondsRemaining: Int

    // calculates progress
    private var progress: Double {
        guard secondsRemaining > 0 else { return 1 }
        let totalSeconds = Double(secondsElaped + secondsRemaining)
        return Double(secondsElaped) / totalSeconds
    }

    private var minutesRemaining: Int {
        secondsRemaining / 60
    }

    private var minutesRemainingMatric: String {
        minutesRemaining == 1 ? "minute" : "minutes"
    }

    let scrumColor: Color

    var body: some View {
        VStack {
            ProgressView(value: progress)

            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElaped)", systemImage: "hourglass.bottomhalf.fill")
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) \(minutesRemainingMatric)")

    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElaped: .constant(60), secondsRemaining: .constant(180), scrumColor: DailyScrum.data[0].color)
            .previewLayout(.sizeThatFits)
    }
}
