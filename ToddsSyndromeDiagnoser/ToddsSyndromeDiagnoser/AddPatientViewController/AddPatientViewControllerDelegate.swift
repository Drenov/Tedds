//
//  AddPatientViewControllerDelegate.swift
//  ToddsSyndromeDiagnoser
//
//  Created by Andrii Mykhailov on 2/5/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation
import Diagnoser

protocol AddPatientViewControllerDelegate: class {
    func addPatientViewControllerDelegateDidTapAdd(record: MedicalRecord)
}
