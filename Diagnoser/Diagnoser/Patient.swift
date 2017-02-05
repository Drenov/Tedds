//
//  Patient.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

public enum Gender: Int {
    case male
    case female
}

public class Patient: DictionaryRepresentable {
    let name: String
    let age: Int
    let gender: Gender
    
    let hasMigraines: Bool
    let usesDrugs: Bool
    
    public init(name: String, age: Int, gender: Gender, hasMigraines: Bool, usesDrugs: Bool) {
        self.name = name
        self.age = age
        self.gender = gender
        self.hasMigraines = hasMigraines
        self.usesDrugs = usesDrugs
    }
    
    public required convenience init(dictionary: [String: Any]) throws {
        guard let name = dictionary["name"] as? String,
            let age = dictionary["age"] as? Int,
            let gender = dictionary["gender"] as? Gender,
            let hasMigraines = dictionary["hasMigraines"] as? Bool,
            let usesDrugs = dictionary["usesDrugs"] as? Bool
            else {
                throw DictionaryRepresentableError.parsingFailed
        }
        
        self.init(name: name,
                  age: age,
                  gender: gender,
                  hasMigraines: hasMigraines,
                  usesDrugs: usesDrugs)
    }
    
    public func toDictionary() -> [String : Any] {
        return [
            "name": name,
            "age": age,
            "gender": gender,
            "hasMigraines": hasMigraines,
            "usesDrugs": usesDrugs
        ]
    }
}
