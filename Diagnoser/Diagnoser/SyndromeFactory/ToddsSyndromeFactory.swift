//
//  ToddsSyndromeFactory.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/5/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

public class ToddsSyndromeFactory: SyndromeFactory {
    public func syndromeFromName(_ name: String, probability: SyndromeProbability) throws -> Syndrome {
        switch name {
        case ToddsSyndromeConstants.syndromeName:
            return ToddsSyndrome(probability: probability)
            
        default:
            throw SyndromeFactoryError.undefinedSyndromeName
        }
    }
    
    public func syndromeFromDictionary(_ dictionary: [String: Any]) throws -> Syndrome {
        guard let syndromeName = dictionary["name"] as? String else {
            throw DictionaryRepresentableError.parsingFailed
        }
        
        switch syndromeName {
        case ToddsSyndromeConstants.syndromeName:
            return try ToddsSyndrome(dictionary: dictionary)
            
        default:
            throw SyndromeFactoryError.undefinedSyndromeName
        }
    }
}
