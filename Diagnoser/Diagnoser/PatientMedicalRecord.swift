//
//  PatientMedicalRecord.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

public class PatientMedicalRecord {
    let patient: Patient
    
    private (set) var syndromes: [Syndrome] = []
    
    init(patient: Patient) {
        self.patient = patient
    }
    
    func addSyndrome(_ syndrome: Syndrome) {
        syndromes.append(syndrome)
    }
    
    func removeSyndrome(_ syndrome: Syndrome) {
        let index = syndromes.index { $0.name == syndrome.name }
        
        if let index = index {
            syndromes.remove(at: index)
        }
    }
}
