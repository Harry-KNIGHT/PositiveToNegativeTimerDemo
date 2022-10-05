//
//  ButtonsView.swift
//  PositiveToNegativeTimerDemo
//
//  Created by Elliot Knight on 05/10/2022.
//

import SwiftUI

struct ButtonsView: View {

	@Binding var startAndPauseCountDown: Bool
	@Binding var countDownValueWasZero: Bool
	@Binding var timeRemaining: Int

	var body: some View {
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
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
		ButtonsView(startAndPauseCountDown: .constant(false), countDownValueWasZero: .constant(false), timeRemaining: .constant(5))
    }
}
