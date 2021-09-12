//
//  MainScreenPageObject.swift
//  WriteMeUITests
//
//  Created by Pets-y on 11.09.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import XCTest


/// Очень напоминает SubscribeFeedViewModel, это программное взаимодействие
/// с экраном подписки на фид
struct MainPage {
    
    var phone: String { phoneInput.value as? String ?? "" }
    
    private let app: XCUIApplication
    private let view: XCUIElement
    
    private var settingsButton: XCUIElement { app.navigationBars.buttons[.mainScreenSettingsButton] }
    private var wButton: XCUIElement { view.buttons[.mainScreenWButton] }
    private var phoneInput: XCUIElement { view.textFields[.mainScreenPhoneInput] }
    
    init(app: XCUIApplication) {
        self.app = app
        self.view = app.otherElements[.mainScreenMainView]
    }
    
    func goToSettings() {
        settingsButton.tap()
    }
    
    func openWA() {
        wButton.tap()
    }
    
    func typePhone(_ phone: String) {
        phoneInput.tap()
        phoneInput.typeText(phone)
    }

}
