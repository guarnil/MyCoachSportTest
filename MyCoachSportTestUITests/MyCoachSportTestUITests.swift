//
//  MyCoachSportTestUITests.swift
//  MyCoachSportTestUITests
//
//  Created by Luca Guarnieri on 12/04/2022.
//

import XCTest

class MyCoachSportTestUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()

    }

    override func tearDownWithError() throws {
    }

    func testLabel() throws {
        let label = app.staticTexts["👊 🤚 ✌️"]
        
        XCTAssert(label.exists)
    }
    
    func testStartButton() throws {
        let startButton = app.buttons["START"]
     
        XCTAssert(startButton.exists)
    }
    
    func testChangeTypeGameButton() throws {
        let changeGameTypeButton = app.buttons["changeGameTypeButton"]
     
        XCTAssert(changeGameTypeButton.exists)
    }
    
    func testChangeTypeGameLabel() throws {
        let changeGameTypeLabel = app.buttons["👨‍🦲 VS 🤖"]
     
        XCTAssert(changeGameTypeLabel.exists)
    }
    
    func testChangeTypeGameLabelAfterTap() throws {
        app.buttons["changeGameTypeButton"].tap()
        let changeGameTypeLabelAfterTap = app.buttons["🤖 VS 🤖"]
     
        XCTAssert(changeGameTypeLabelAfterTap.exists)
    }
    
    
    func testPlayerVsBotAppearance() throws {
        app.buttons["START"].tap()
        
        let head = app.staticTexts["👨‍🦲"]
        XCTAssert(head.exists)
    }
    
    func testBotVsBotAppearance() throws {
        app.buttons["changeGameTypeButton"].tap()
        app.buttons["START"].tap()
        
        let head = app.staticTexts["👨‍🦲"]
        XCTAssertFalse(head.exists)
    }
    
    func testReturnToMenuButtonAppearance() throws {
        app.buttons["START"].tap()
        
        let returnToMenuButton = app.buttons["MENU"]
        XCTAssert(returnToMenuButton.exists)
    }
    
    func testReturnToMenu() throws {
        app.buttons["START"].tap()
        app.buttons["MENU"].tap()
        
        let label = app.staticTexts["👊 🤚 ✌️"]
        XCTAssert(label.exists)
    }
    
    func testReplayButton() throws {
        app.buttons["changeGameTypeButton"].tap()
        app.buttons["START"].tap()
        
        let replayButton = app.buttons["REPLAY"]
        XCTAssert(replayButton.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
