//
//  ContentView.swift
//  PositiveToNegativeTimerDemo
//
//  Created by Elliot Knight on 05/10/2022.
//

import SwiftUI

struct TimeParts {
	var seconds = 0
	var minutes = 0
	/// The string representation of the time parts (ex: 01:23)
	var description: String {
		return NSString(format: "%02d:%02d", minutes, seconds) as String
	}
}

struct ContentView: View {

	var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
	@State private var timeRemaining: Int = 5
	@State private var startAndPauseCountDown = false
	@State private var countDownValueWasZero = false
	var body: some View {
		VStack(spacing: 15) {
			Text(countDownValueWasZero ? "Extra time" : "Keep going")


			HStack(alignment: .center, spacing: 1) {
				if countDownValueWasZero {
					Text("+")
				}
				Text(String(timeRemaining.toTimeParts().description))
			}

			HStack {
				Button(action: {
					startAndPauseCountDown.toggle()

				}, label: {
					Image(systemName: startAndPauseCountDown ? "pause.circle.fill" : "play.circle.fill")

						.font(.largeTitle)
				})


				if startAndPauseCountDown  {
					Button(action: {
						timeRemaining = 5
						startAndPauseCountDown = false
						countDownValueWasZero = false

					}, label: {
						Image(systemName: "clock.arrow.2.circlepath")
							.font(.largeTitle)
							.foregroundColor(.red)
					})
				}
			}
		}
		.font(.title2)
		.padding(30)
		.frame(width: 180)

		.background(.regularMaterial.shadow(.inner(color: .gray, radius: 10)))


		.cornerRadius(10)
		.onReceive(timer) { time in
			if !countDownValueWasZero && startAndPauseCountDown  {
				if timeRemaining > 0 {
					timeRemaining -= 1
				} else {
					countDownValueWasZero = true
				}
			} else if countDownValueWasZero && startAndPauseCountDown {
				timeRemaining += 1
			}
		}
	}
}

extension Int {
	func toTimeParts() -> TimeParts {
		let seconds = self
		var mins = 0

		var secs = seconds
		if seconds >= 60 {
			mins = Int(seconds / 60)
			secs = seconds - (mins * 60)
		}

		return TimeParts(seconds: secs, minutes: mins)
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

