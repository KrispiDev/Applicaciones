//
//  BoardUITest.swift
//  MemoryGameUITests
//
//  Created by KrispiDev on 20/5/23.
//

import XCTest

class BoardUITest: XCTestCase  {
    
    private let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        app.otherElements.buttons["Easy"].tap()
    }

    func testTitle() throws {        
        let title = app.staticTexts["easy".uppercased()]
        XCTAssert(title.exists)
    }

}
