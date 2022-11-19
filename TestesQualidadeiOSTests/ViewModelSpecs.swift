//
//  ViewModelSpecs.swift
//  TestesQualidadeiOSTests
//
//  Created by Robson Moreira on 19/11/22.
//

import Quick
import Nimble
@testable import TestesQualidadeiOS

class ViewModelSpecs: QuickSpec {
    
    override func spec() {
        
        var sut: ViewModel!
        
        beforeEach {
            sut = ViewModel(hasCourse: true)
        }
        
        describe("ViewModel") {
            context("GetDefaultCourse") {
                var hasCourse: Bool!
                var fail: Bool!
                
                beforeEach {
                    hasCourse = false
                    fail = false
                }
                
                it("HasCourseIsTrue") {
                    sut.getDefaultCourse { _ in
                        hasCourse = true
                    } fail: {
                        fail = true
                    }

                    expect(hasCourse).to(beTrue())
                    expect(fail).to(beFalse())
                }
                
                it("HasCourseIsFalse") {
                    sut.hasCourse = false
                    
                    sut.getDefaultCourse { _ in
                        hasCourse = true
                    } fail: {
                        fail = true
                    }

                    expect(hasCourse).to(beFalse())
                    expect(fail).to(beTrue())
                }
            }
            
            context("ChangeHasCourseStatus") {
                it("ChangeHasCourseStatusFalse") {
                    sut.changeHasCourseStatus()
                    await expect(sut.hasCourse).toEventually(beFalse())
                }
            }
            
            context("GetHasCourseStatus") {
                it("GetHasCourseStatusTrue") {
                    await waitUntil { done in
                        sut.getHasCourseStatus { result in
                            expect(result).to(beTrue())
                            done()
                        }
                    }
                }
            }
            
            context("GetCategorie") {
                it("GetCategorieFirstWithSuccess") {
                    sut = ViewModel(hasCourse: true, service: ServicesDummy(status: .success))
                    sut.getCategorie()
                    expect(sut.status).to(equal("animal"))
                }
                
                it("GetCategorieFirstWithError") {
                    sut = ViewModel(hasCourse: true, service: ServicesDummy(status: .invalidResponse))
                    sut.getCategorie()
                    expect(sut.status).to(equal("Erro"))
                }
            }
            
            context("ChangeCourse") {
                it("ChangeCourseAction") {
                    sut = ViewModel(hasCourse: true)
                    expect(sut.changeCourse()).to(beVoid())
                }
            }
        }
        
        afterEach {
            sut = nil
        }
    }
}
