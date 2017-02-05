//
//  MedicalRecordsCell.swift
//  ToddsSyndromeDiagnoser
//
//  Created by Andrii Mykhailov on 2/5/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import UIKit
import Diagnoser

class MedicalRecordsCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var probabilityLabel: UILabel!
    
    func fillFromMedicalRecord(_ medicalRecord: MedicalRecord) {
        nameLabel.text = medicalRecord.patient.name
        ageLabel.text = String(medicalRecord.patient.age)
        
        let toddsSyndrome = medicalRecord.syndromes.flatMap { $0 as? ToddsSyndrome }.first
        if let toddsSyndromeProbability = toddsSyndrome?.probability {
            probabilityLabel.text = String(toddsSyndromeProbability)
        }
    }
}
