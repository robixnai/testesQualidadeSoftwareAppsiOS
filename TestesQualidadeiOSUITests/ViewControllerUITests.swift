//
//  ViewControllerUITests.swift
//  TestesQualidadeiOSUITests
//
//  Created by Robson Moreira on 19/11/22.
//

import XCTest

final class ViewControllerUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws { }

    func testChangeCourseAction() throws {
        let app = XCUIApplication()
        app.launch()
        
        let courseTitleLabel = app.staticTexts["courseTitleLabel"]
        let durationTitleLabel = app.staticTexts["durationTitleLabel"]
        let contactTitleLabel = app.staticTexts["contactTitleLabel"]
        let courseValueLabel = app.staticTexts["courseValueLabel"]
        let durationValueLabel = app.staticTexts["durationValueLabel"]
        let contactValueLabel = app.staticTexts["contactValueLabel"]
        let changeCourseButton = app.buttons["Trocar de Curso"]
        
        XCTAssertEqual(courseTitleLabel.label, "Titulo:")
        XCTAssertEqual(durationTitleLabel.label, "Duração:")
        XCTAssertEqual(contactTitleLabel.label, "Contato:")
        
        XCTAssertEqual(courseValueLabel.label, "Swift")
        XCTAssertEqual(durationValueLabel.label, "6 hora(s)")
        XCTAssertEqual(contactValueLabel.label, "swift@curso.com")
        
        changeCourseButton.tap()
        XCTAssertEqual(courseValueLabel.label, "SwiftUI + Combine")
        XCTAssertEqual(durationValueLabel.label, "8 hora(s)")
        XCTAssertEqual(contactValueLabel.label, "swift_combine@curso.com")
        
        changeCourseButton.tap()
        XCTAssertEqual(courseValueLabel.label, "Swift")
        XCTAssertEqual(durationValueLabel.label, "6 hora(s)")
        XCTAssertEqual(contactValueLabel.label, "swift@curso.com")
    }
    
    func testChangeCourseActionShapshot() throws {
        let app = XCUIApplication()
        app.launch()
        
        let trocarDeCursoStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Trocar de Curso"]/*[[".buttons[\"Trocar de Curso\"].staticTexts[\"Trocar de Curso\"]",".staticTexts[\"Trocar de Curso\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        trocarDeCursoStaticText.tap()
        trocarDeCursoStaticText.tap()
    }
}
