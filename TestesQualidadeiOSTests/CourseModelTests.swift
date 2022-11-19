//
//  CourseModelTests.swift
//  TestesQualidadeiOSTests
//
//  Created by Robson Moreira on 18/11/22.
//

import XCTest
@testable import TestesQualidadeiOS

final class CourseModelTests: XCTestCase {
    
    var sut: CourseModel!

    override func setUpWithError() throws {
        sut = CourseModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGetDurationCourse6() {
        let duration = sut.getDuration()
        
        XCTAssertEqual(duration, 6, "Deve retornar duração do curso de 6 horas")
    }
    
    func testGetDurationCourse8() {
        sut.course = "SwiftUI + Combine"
        let duration = sut.getDuration()
        
        XCTAssertEqual(duration, 8, "Deve retornar duração do curso de 8 horas")
    }
    
    func testGetDurationCourse0() {
        sut.course = ""
        let duration = sut.getDuration()
        
        XCTAssertEqual(duration, 0, "Deve retornar 0, pois não tem curso com a carga horária")
    }

    func testGetDurationCourseGreaterThan6() {
        let swiftDuration = sut.getDuration()
        
        sut.course = "SwiftUI + Combine"
        let duration = sut.getDuration()
        
        XCTAssertGreaterThan(duration, swiftDuration)
    }
    
    func testGetDurationCourseLessThan6() {
        let swiftDuration = sut.getDuration()
        
        sut.course = "SwiftUI + Combine"
        let duration = sut.getDuration()
        
        XCTAssertLessThan(swiftDuration, duration)
    }
}
