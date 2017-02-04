//
//  Diagnoser.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

public typealias SyndromeProbability = Int

public protocol Diagnoser {
    func diagnose(patient: Patient) -> SyndromeProbability
}
