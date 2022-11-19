//
//  ExtensionsTests.swift
//  TestesQualidadeiOSTests
//
//  Created by Robson Moreira on 18/11/22.
//

import XCTest
@testable import TestesQualidadeiOS

final class ExtensionsTests: XCTestCase {

    var course = CourseModel()
    
    func testIsValidEmail() {
        let email = course.contact!
        let value = email.isValidEmail()
        
        XCTAssertTrue(value, "Não é um e-mail válido!")
    }
    
    func testIsNotValidEmail() {
        let email = course.contact.replace(string: "@", replacement: "")
        let value = email.isValidEmail()
        
        XCTAssertFalse(value, "É um e-mail válido!")
    }
    
    func testRemoveWhitespace() {
        let text = "Swift + Combine"
        let value = text.removeWhitespaces()
        
        XCTAssert(value == "Swift+Combine")
    }
    
    func testReplace() {
        let text = course.course!
        let replaceStoD = text.replace(string: "S", replacement: "D")
        let replaceTtoK = replaceStoD.replace(string: "t", replacement: "k")
        
        XCTAssert(replaceStoD == "Dwift")
        XCTAssert(replaceTtoK == "Dwifk")
    }

}
