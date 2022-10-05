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
	@State private var startAndPauseCountDown = false
	@State private var countDownValueWasZero = false
	@StateObject var convertTimeVm = ConvertTimeViewModel()
	var body: some View {
		VStack(spacing: 15) {
			Text(countDownValueWasZero ? "Extra time" : "Keep going")

			HStack(alignment: .center, spacing: 1) {
				if countDownValueWasZero {
					Text("+")
				}
				Text(String(convertTimeVm.convertSecondToTime(timeInSeconds: timeRemaining)))
			}

			ButtonsView(startAndPauseCountDown: $startAndPauseCountDown, countDownValueWasZero: $countDownValueWasZero, timeRemaining: $timeRemaining)
		}
		.modifier(TimeRemainingViewModifier())

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
			.frame(width: 180)
			.background(.regularMaterial.shadow(.inner(color: .gray, radius: 10)))
			.cornerRadius(10)
	}
}
