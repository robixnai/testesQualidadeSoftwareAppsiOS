//
//  ViewModel.swift
//  TestesQualidadeiOS
//
//  Created by Robson Moreira on 18/11/22.
//

import Foundation

protocol ViewModelProtocol {
    var status: String { get set }
    func changeCourse()
    func getDefaultCourse(completion: @escaping (CourseModel) -> (), fail: () -> ())
    func changeHasCourseStatus()
    func getHasCourseStatus(completion: @escaping (Bool) -> ())
    func getCategorie()
}

class ViewModel: ViewModelProtocol {
    
    var status: String
    
    private let service: ServicesProtocol
    
    var hasCourse: Bool
    
    init(hasCourse: Bool, service: ServicesProtocol = Services()) {
        self.hasCourse = hasCourse
        self.service = service
        self.status = ""
    }
    
    func changeCourse() {
        print("Curso alterado com sucesso!")
    }
    
    func getDefaultCourse(completion: @escaping (CourseModel) -> (), fail: () -> ()) {
        if hasCourse {
            completion(CourseModel())
        } else {
            fail()
        }
    }
    
    func changeHasCourseStatus() {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.hasCourse = false
        }
    }
    
    func getHasCourseStatus(completion: @escaping (Bool) -> ()) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.2) { [weak self] in
            guard let self = self else { return }
            completion(self.hasCourse)
        }
    }
    
    func getCategorie() {
        service.fetchChucknorrisCategories { categories, error in
            if error != nil {
                self.status = "Erro"
                return
            }
            
            if let categories {
                self.status = categories[0]
            }
        }
    }
}
