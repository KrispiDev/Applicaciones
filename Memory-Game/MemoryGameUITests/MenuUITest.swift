//
//  test.swift
//  MemoryGameTests
//
//  Created by KrispiDev on 20/5/23.
//

import XCTest

class test: XCTestCase {

    private let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testTitle() throws {
        let title = app.staticTexts.element.firstMatch
        XCTAssert(title.exists)
        XCTAssertEqual(title.label, "El juego de memoria de las consolas de videojuegos.".uppercased())
    }
    
    func testButtonsCount() throws {
        XCTAssertEqual(app.otherElements.buttons.count, 3)
    }

}
