//
//  ViewModelDummy.swift
//  TestesQualidadeiOSTests
//
//  Created by Robson Moreira on 19/11/22.
//

@testable import TestesQualidadeiOS

class ViewModelDummy: ViewModelProtocol {
    
    var status: String = ""
    var hasCourse = false
    
    func changeCourse() {
        hasCourse = true
    }
    
    func getDefaultCourse(completion: @escaping (TestesQualidadeiOS.CourseModel) -> (), fail: () -> ()) {
        completion(CourseModel())
    }
    
    func changeHasCourseStatus() { }
    
    func getHasCourseStatus(completion: @escaping (Bool) -> ()) { }
    
    func getCategorie() { }
}
