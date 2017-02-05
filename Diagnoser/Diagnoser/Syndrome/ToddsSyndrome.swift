//
//  ToddsSyndrome.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

internal struct ToddsSyndromeConstants {
    static let syndromeName = "Todd's Syndrome"
    static let syndromeAge = 15
    
    static let hasMigrainesProbability = 25
    static let ageProbability = 25
    static let genderProbability = 25
    static let usesDrugsProbability = 25
}

public struct ToddsSyndrome: Syndrome {
    public let name: String
    
    public let probability: SyndromeProbability
    
    public init(probability: SyndromeProbability) {
        self.name = ToddsSyndromeConstants.syndromeName
        self.probability = probability
    }
}

extension ToddsSyndrome: DictionaryRepresentable {
    public init(dictionary: [String: Any]) throws {
        guard let name = dictionary["name"] as? String,
              let probability = dictionary["probability"] as? Int else {
                
            throw DictionaryRepresentableError.parsingFailed
        }
        
        self.name = name
        self.probability = probability
    }
}
