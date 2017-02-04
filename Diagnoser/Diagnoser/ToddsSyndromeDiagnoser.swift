//
//  ToddsSyndromeDiagnoser.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

private struct ToddsSyndromeDiagnoserConstants {
    static let syndromeAge = 15
    
    static let hasMigrainesProbability = 25
    static let ageProbability = 25
    static let genderProbability = 25
    static let usesDrugsProbability = 25
}

public class ToddsSyndromeDiagnoser: Diagnoser {
    public func diagnose(patient: Patient) -> SyndromeProbability {
        var probability: SyndromeProbability = 0
        
        if patient.hasMigraines {
            probability += ToddsSyndromeDiagnoserConstants.hasMigrainesProbability
        }
        
        if patient.age <= ToddsSyndromeDiagnoserConstants.syndromeAge {
            probability += ToddsSyndromeDiagnoserConstants.ageProbability
        }
        
        if patient.gender == .male {
            probability += ToddsSyndromeDiagnoserConstants.genderProbability
        }
        
        if patient.usesDrugs {
            probability += ToddsSyndromeDiagnoserConstants.usesDrugsProbability
        }
        
        return probability
    }
}
