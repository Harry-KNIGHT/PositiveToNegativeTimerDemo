//
//  TimerView.swift
//  PositiveToNegativeTimerDemo
//
//  Created by Elliot Knight on 05/10/2022.
//

import SwiftUI

struct TimerView: View {

	var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
	@Binding var timeRemaining: Int
	@State private var startAndPauseCountDown = true
	@StateObject var convertTimeVm = ConvertTimeViewModel()
	@State private var startSession = 0
	@State private var isExtaTime = false

	var body: some View {
		VStack(spacing: 15) {
			Text(timeRemaining < startSession ? "Extra time" : "Keep going")

			HStack(alignment: .center, spacing: 1) {
				if isExtaTime  {
					Text("+")
				}
				Text(String(convertTimeVm.convertSecondToTime(timeInSeconds: startSession)))
			}

			ButtonsView(startAndPauseCountDown: $startAndPauseCountDown, timeRemaining: $timeRemaining, resetTimeSelected: $timeRemaining)
		}
		.modifier(TimeRemainingViewModifier())
		.onReceive(timer) { time in
			if startAndPauseCountDown  {
				startSession += 1
			}
		}
		.task {
			if convertTimeVm.convertTimeSelectedInSecondsToMinutes(timeInSeconds: timeRemaining) < startSession {
				isExtaTime = true
			}
		}
	}
}


struct TimerView_Previews: PreviewProvider {
	static var previews: some View {
		TimerView(timeRemaining: .constant(5))
	}
}

struct TimeRemainingViewModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.title2)
			.padding(30)
			.background(.regularMaterial.shadow(.inner(color: .gray, radius: 10)))
			.cornerRadius(10)
	}
}
