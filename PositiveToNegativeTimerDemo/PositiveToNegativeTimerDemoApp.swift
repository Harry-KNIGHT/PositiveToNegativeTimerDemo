//
//  PositiveToNegativeTimerDemoApp.swift
//  PositiveToNegativeTimerDemo
//
//  Created by Elliot Knight on 05/10/2022.
//

import SwiftUI

@main
struct PositiveToNegativeTimerDemoApp: App {
	@StateObject public var converterVM = ConvertTimeViewModel()
    var body: some Scene {
        WindowGroup {
            StartTimerView()
				.environmentObject(converterVM)
        }
    }
}
