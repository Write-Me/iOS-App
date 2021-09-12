//
//  Main_UITests.swift
//  WriteMeUITests
//
//  Created by Pets-y on 11.09.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import XCTest

class Main_UITests: XCTestCase {
    
    var app: XCUIApplication!
    var mainPage: MainPage!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        mainPage = MainPage(app: app)
    }
    
    func test_goToSettings() {
        mainPage.goToSettings()
//        XCTAssertTrue(true)
    }
    
    func test_enterPhone_withError() {
        mainPage.typePhone("999")
        mainPage.openWA()
    }
}
