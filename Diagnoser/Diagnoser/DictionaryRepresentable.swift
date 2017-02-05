//
//  DictionaryRepresentable.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

public protocol DictionaryRepresentable {
    init(dictionary: [String: Any]) throws
    
    func toDictionary() -> [String: Any]
}

public enum DictionaryRepresentableError: Error {
    case parsingFailed
}
