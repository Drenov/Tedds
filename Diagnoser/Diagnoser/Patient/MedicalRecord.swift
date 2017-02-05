//
//  MedicalRecord.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

public class MedicalRecord: DictionaryRepresentable {
    public let patient: Patient
    
    private(set) public var syndromes: [Syndrome] = []
    
    public init(patient: Patient) {
        self.patient = patient
    }
    
    public required convenience init(dictionary: [String: Any]) throws {
        try self.init(dictionary: dictionary, syndromeFactory: ToddsSyndromeFactory())
    }
    
    public init(dictionary: [String: Any], syndromeFactory: SyndromeFactory) throws {
        guard let patientDictionary = dictionary["patient"] as? [String: Any],
            let syndromeArray = dictionary["syndromes"] as? [[String: Any]] else {
                
                throw DictionaryRepresentableError.parsingFailed
        }
        
        try self.patient = Patient(dictionary: patientDictionary)
        try self.syndromes = syndromeArray.map { try syndromeFactory.syndromeFromDictionary($0) }
    }
    
    public func toDictionary() -> [String : Any] {
        return [
            "patient": patient.toDictionary(),
            "syndromes": syndromes.map { $0.toDictionary() }
        ]
    }
    
    public func addSyndrome(_ syndrome: Syndrome) {
        syndromes.append(syndrome)
    }
    
    public func removeSyndrome(_ syndrome: Syndrome) {
        let index = syndromes.index { $0.name == syndrome.name }
        
        if let index = index {
            syndromes.remove(at: index)
        }
    }
}
