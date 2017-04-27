//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by Jaron Patena on 4/26/17.
//  Copyright © 2017 Brandon Saunders. All rights reserved.
//

import XCTest

class CalculatorUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddition() {
        
        let app = XCUIApplication()
        app.buttons["2"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["+"].tap()
        
        XCTAssert(app.staticTexts["4.0"].exists)
        sleep(1)
    }
    
    func testSubtraction() {
        
        let app = XCUIApplication()
        app.buttons["4"].tap()
        app.buttons["−"].tap()
        app.buttons["2"].tap()
        app.buttons["−"].tap()
        
        XCTAssert(app.staticTexts["2.0"].exists)
        sleep(1)
    }
    
    func testMultiplication() {
        
        let app = XCUIApplication()
        app.buttons["5"].tap()
        app.buttons["×"].tap()
        app.buttons["2"].tap()
        app.buttons["×"].tap()
        
        XCTAssert(app.staticTexts["10.0"].exists)
        sleep(1)
    }
    
    func testDivision() {
        
        let app = XCUIApplication()
        app.buttons["3"].tap()
        app.buttons["0"].tap()
        app.buttons["÷"].tap()
        app.buttons["2"].tap()
        app.buttons["÷"].tap()
        
        XCTAssert(app.staticTexts["15.0"].exists)
        sleep(1)
    }
    
    
}
