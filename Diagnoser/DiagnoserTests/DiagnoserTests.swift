//
//  DiagnoserTests.swift
//  DiagnoserTests
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import XCTest
@testable import Diagnoser

class DiagnoserTests: XCTestCase {
    
    var diagnoser = ToddsSyndromeDiagnoser()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testToddsSyndromeDiagnoser() {
        let patient1 = Patient(name: "Andrii", age: 32, gender: .male, hasMigraines: false, usesDrugs: false)
        
        let syndrome1 = diagnoser.diagnose(patient: patient1)
        XCTAssertEqual(syndrome1.name, "Todd's Syndrome")
        XCTAssertEqual(syndrome1.probability, 25)
        
        let patient2 = Patient(name: "John", age: 5, gender: .male, hasMigraines: true, usesDrugs: true)
        
        let syndrome2 = diagnoser.diagnose(patient: patient2)
        XCTAssertEqual(syndrome2.name, "Todd's Syndrome")
        XCTAssertEqual(syndrome2.probability, 100)
        
        let patient3 = Patient(name: "Ann", age: 15, gender: .female, hasMigraines: true, usesDrugs: false)
        
        let syndrome3 = diagnoser.diagnose(patient: patient3)
        XCTAssertEqual(syndrome3.name, "Todd's Syndrome")
        XCTAssertEqual(syndrome3.probability, 50)
    }
    
}
