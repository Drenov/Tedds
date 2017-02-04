//
//  ToddsSyndromeDiagnoser.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

public class ToddsSyndromeDiagnoser: Diagnoser {
    public func diagnose(patient: Patient) -> Syndrome {
        var probability: SyndromeProbability = 0
        
        if patient.hasMigraines {
            probability += ToddsSyndromeConstants.hasMigrainesProbability
        }
        
        if patient.age <= ToddsSyndromeConstants.syndromeAge {
            probability += ToddsSyndromeConstants.ageProbability
        }
        
        if patient.gender == .male {
            probability += ToddsSyndromeConstants.genderProbability
        }
        
        if patient.usesDrugs {
            probability += ToddsSyndromeConstants.usesDrugsProbability
        }
        
        return ToddsSyndrome(probability: probability)
    }
}
