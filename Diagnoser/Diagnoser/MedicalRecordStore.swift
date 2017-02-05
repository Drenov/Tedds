//
//  MedicalRecordStore.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

public protocol MedicalRecordStore {
    func loadMedicalRecords(completion: ([MedicalRecord]) -> Void) throws
    func saveMedicalRecords(_ medicalRecords: [MedicalRecord], completion: () -> Void) throws
}
