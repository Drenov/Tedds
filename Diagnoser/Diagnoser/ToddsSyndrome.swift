//
//  ToddsSyndrome.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

internal struct ToddsSyndromeConstants {
    static let syndromeAge = 15
    
    static let hasMigrainesProbability = 25
    static let ageProbability = 25
    static let genderProbability = 25
    static let usesDrugsProbability = 25
}

public struct ToddsSyndrome: Syndrome {
    public let name: String = "Todd's Syndrome"
    
    public let probability: SyndromeProbability
    
    init(probability: SyndromeProbability) {
        self.probability = probability
    }
}
