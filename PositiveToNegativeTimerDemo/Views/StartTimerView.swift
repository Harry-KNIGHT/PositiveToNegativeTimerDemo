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
	@EnvironmentObject var convertVM: ConvertTimeViewModel
    var body: some View {
		NavigationView {
			VStack {
				Text("\(timeSelected)min =  \(convertVM.convertTimeSelectedInSecondsToMinutes(timeInSeconds: timeSelected))secs")
				HStack {

					Text("Session time")
					Picker("Select session time", selection: $timeSelected) {
						ForEach(1...60, id: \.self) { number in
							Text(String(number) + "min")
						}
					}
					.padding(6)

					.background(.regularMaterial)
					.cornerRadius(10)
				}

				NavigationLink(destination: TimerView(timeRemaining: $timeSelected), isActive: $isNavigationActive) {
					Button("Start Session !") {
						isNavigationActive = true
					}
					.buttonStyle(.borderedProminent)
					.buttonBorderShape(.roundedRectangle)
				}
			}
			.modifier(TimeRemainingViewModifier())
		}
    }
}

struct StartTimerView_Previews: PreviewProvider {
    static var previews: some View {
        StartTimerView()
			.environmentObject(ConvertTimeViewModel())
    }
}

