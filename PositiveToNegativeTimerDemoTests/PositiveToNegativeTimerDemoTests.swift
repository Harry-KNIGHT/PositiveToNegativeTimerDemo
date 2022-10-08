//
//  PositiveToNegativeTimerDemoTests.swift
//  PositiveToNegativeTimerDemoTests
//
//  Created by Elliot Knight on 08/10/2022.
//

import XCTest
@testable import PositiveToNegativeTimerDemo

final class PositiveToNegativeTimerDemoTests: XCTestCase {
	var sut: ConvertTimeViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

		sut = ConvertTimeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

	func test1secondsConvertedInto60Seconds() {
		// Given
		let input = 1

		// When
		let calcul = sut.convertTimeSelectedInSecondsToMinutes(timeInSeconds: input)

		// Then
		XCTAssertEqual(calcul, 60)
	}

	func test_secondsToTime() {
		let input = 120

		let secondsToTime = sut.convertSecondToTime(timeInSeconds: input)

		XCTAssertEqual(secondsToTime, "02:00")
	}
}
