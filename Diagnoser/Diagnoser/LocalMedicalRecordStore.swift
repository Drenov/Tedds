//
//  LocalMedicalRecordStore.swift
//  Diagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation

struct LocalMedicalRecordStoreConstants {
    static let fileName = "MedicalRecords.plist"
}

public class LocalMedicalRecordStore: MedicalRecordStore {
    
    public func loadMedicalRecords(completion: ([MedicalRecord]) -> Void) throws {
        let unarchivedData = NSKeyedUnarchiver.unarchiveObject(withFile: fullPath.absoluteString)
        
        guard let medicalRecordsArray = unarchivedData as? [[String: Any]] else {
            throw DictionaryRepresentableError.parsingFailed
        }
        
        let medicalRecords = try medicalRecordsArray.map { try MedicalRecord(dictionary: $0) }
        completion(medicalRecords)
    }
    
    public func saveMedicalRecords(_ medicalRecords: [MedicalRecord], completion: () -> Void) throws {
        let medicalRecordsArray = medicalRecords.map { $0.toDictionary() }
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: medicalRecordsArray)
        
        let fileName = LocalMedicalRecordStoreConstants.fileName
        let fullPath = getDocumentsDirectory().appendingPathComponent(fileName)
        
        try archivedData.write(to: fullPath)
        
        completion()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    private var fullPath: URL {
        let fileName = LocalMedicalRecordStoreConstants.fileName
        
        return getDocumentsDirectory().appendingPathComponent(fileName)
    }
}
