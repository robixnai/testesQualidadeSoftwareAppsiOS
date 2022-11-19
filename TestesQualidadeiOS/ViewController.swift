//
//  ViewController.swift
//  TestesQualidadeiOS
//
//  Created by Robson Moreira on 18/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var courseTitleLabel: UILabel! {
        didSet {
            courseTitleLabel.accessibilityIdentifier = "courseTitleLabel"
        }
    }
    @IBOutlet weak var durationTitleLabel: UILabel! {
        didSet {
            durationTitleLabel.accessibilityIdentifier = "durationTitleLabel"
        }
    }
    @IBOutlet weak var contactTitleLabel: UILabel! {
        didSet {
            contactTitleLabel.accessibilityIdentifier = "contactTitleLabel"
        }
    }
    @IBOutlet weak var courseValueLabel: UILabel! {
        didSet {
            courseValueLabel.accessibilityIdentifier = "courseValueLabel"
        }
    }
    @IBOutlet weak var durationValueLabel: UILabel! {
        didSet {
            durationValueLabel.accessibilityIdentifier = "durationValueLabel"
        }
    }
    @IBOutlet weak var contactValueLabel: UILabel! {
        didSet {
            contactValueLabel.accessibilityIdentifier = "contactValueLabel"
        }
    }
    
    var viewModel: ViewModelProtocol = ViewModel(hasCourse: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getDefaultCourse { course in
            self.courseValueLabel.text = course.course
            self.durationValueLabel.text = course.duration
            self.contactValueLabel.text = course.contact
        } fail: {
            print("Não existe cursos cadastro!")
        }

    }

    @IBAction func changeCourseAction(_ sender: Any) {
        if courseValueLabel.text == "Swift" {
            courseValueLabel.text = "SwiftUI + Combine"
            durationValueLabel.text = "8 hora(s)"
            contactValueLabel.text = "swift_combine@curso.com"
        } else {
            courseValueLabel.text = "Swift"
            durationValueLabel.text = "6 hora(s)"
            contactValueLabel.text = "swift@curso.com"
        }
        
        viewModel.changeCourse()
        viewModel.getCategorie()
    }
    
}

