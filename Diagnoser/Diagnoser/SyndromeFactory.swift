//
//  SyndromeFactory.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/5/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

public protocol SyndromeFactory {
    func syndromeFromName(_ name: String, probability: SyndromeProbability) throws -> Syndrome
    func syndromeFromDictionary(_ dictionary: [String: Any]) throws -> Syndrome
}

public enum SyndromeFactoryError: Error {
    case undefinedSyndromeName
}
