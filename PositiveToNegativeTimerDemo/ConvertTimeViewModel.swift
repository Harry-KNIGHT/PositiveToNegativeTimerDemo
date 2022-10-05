//
//  ConvertTimeViewModel.swift
//  PositiveToNegativeTimerDemo
//
//  Created by Elliot Knight on 05/10/2022.
//

import Foundation
class ConvertTimeViewModel: ObservableObject {
	
	func convertSecondToTime(timeInSeconds: Int) -> String {
		let minutes = timeInSeconds / 60
		let seconds = timeInSeconds % 60
		print(seconds)
		return String(format: "%02d:%02d", minutes, seconds)
	}
}
