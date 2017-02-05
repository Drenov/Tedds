//
//  Syndrome.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

public typealias SyndromeProbability = Int

public protocol Syndrome: DictionaryRepresentable {
    var name: String { get }
    
    var probability: SyndromeProbability { get }
}

extension Syndrome {
    public func toDictionary() -> [String: Any] {
        return [
            "name": name,
            "probability": probability
        ]
    }
}
