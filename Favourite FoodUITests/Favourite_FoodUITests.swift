//
//  Favourite_FoodUITests.swift
//  Favourite FoodUITests
//
//  Created by vic on 1/11/16.
//  Copyright © 2016 augusteo. All rights reserved.
//

import XCTest

class Favourite_FoodUITests: XCTestCase {
        
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    XCUIApplication().launch()
  }
  
  let exists = NSPredicate(format: "exists == true")
  let app = XCUIApplication()
  
  func testFoo() {
    let textField = app.textFields["tf"]
    textField.tap()
    textField.typeText("foo")
    app.buttons["Calculate"].tap()
    expectation(for: exists, evaluatedWith: app.staticTexts["Pizza"], handler: nil)
    waitForExpectations(timeout: 3, handler: nil)
  }
  
  func testBar() {
    let textField = app.textFields["tf"]
    textField.tap()
    textField.typeText("bar")
    app.buttons["Calculate"].tap()
    expectation(for: exists, evaluatedWith: app.staticTexts["Roast Pork Knuckle"], handler: nil)
    waitForExpectations(timeout: 3, handler: nil)
  }
}
