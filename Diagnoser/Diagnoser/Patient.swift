//
//  Patient.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

public enum Gender {
    case male
    case female
}

public protocol Patient {
    var name: String { get }
    var age: Int { get }
    var gender: Gender { get }
    
    var hasMigraines: Bool { get }
    var usesDrugs: Bool { get }
}
