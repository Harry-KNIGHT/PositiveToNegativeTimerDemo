//
//  StartTimerView.swift
//  PositiveToNegativeTimerDemo
//
//  Created by Elliot Knight on 05/10/2022.
//

import SwiftUI

struct StartTimerView: View {
	@State private var isNavigationActive: Bool = false
	@State private var timeSelected: Int = 10

    var body: some View {
		NavigationView {
			VStack {
				Picker("Select time", selection: $timeSelected) {
					ForEach(1...20, id: \.self) { number in
						Text(String(number) + "min")
					}
				}

				NavigationLink(destination: TimerView(timeRemaining: $timeSelected), isActive: $isNavigationActive) {
					Button("Go to second view") {
						isNavigationActive = true
					}
					.buttonStyle(.borderedProminent)
					.buttonBorderShape(.roundedRectangle)
				}
			}
		}
    }
}

struct StartTimerView_Previews: PreviewProvider {
    static var previews: some View {
        StartTimerView()
    }
}
