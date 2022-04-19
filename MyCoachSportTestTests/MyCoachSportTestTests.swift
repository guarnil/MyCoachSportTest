//
//  MyCoachSportTestTests.swift
//  MyCoachSportTestTests
//
//  Created by Luca Guarnieri on 12/04/2022.
//

import XCTest
@testable import MyCoachSportTest

class MyCoachSportTestTests: XCTestCase {
    
    var gameViewModel: GameViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        gameViewModel = GameViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        gameViewModel = nil
    }

    func testGoodWinner() {
        let winner = gameViewModel.checkResult(firstPlayerSign: .rock, secondPlayerSign: .scissors)
        
        XCTAssertEqual(winner, .PlayerOne)
    }
    
    func testWinningString() {
        let winningString = gameViewModel.getWinningString(gameResult: .PlayerOne, gameType: .PlayerVersusBot)
        
        XCTAssertEqual(winningString, "👨‍🦲\nWIN")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
