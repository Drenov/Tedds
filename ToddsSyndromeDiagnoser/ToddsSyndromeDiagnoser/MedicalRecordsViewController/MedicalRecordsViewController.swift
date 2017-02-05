//
//  MedicalRecordsViewController.swift
//  ToddsSyndromeDiagnoser
//
//  Created by Andrii Mykhailov on 2/4/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import UIKit
import Diagnoser

class MedicalRecordsViewController: UIViewController {

    @IBOutlet var recordsTableView: UITableView!
    
    fileprivate var medicalRecords: [MedicalRecord] = []
    fileprivate var medicalRecordStore: MedicalRecordStore?

    weak var delegate: MedicalRecordsViewControllerDelegate?
    
    static func storyboardController(store: MedicalRecordStore) -> MedicalRecordsViewController {
        let identifier = String(describing: self)
        let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: identifier)
        
        let medicalRecordsViewController = viewController as! MedicalRecordsViewController
        medicalRecordsViewController.medicalRecordStore = store
        
        return medicalRecordsViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try medicalRecordStore?.loadMedicalRecords { [weak self] medicalRecords in
                guard let `self` = self else {
                    return
                }
                
                self.medicalRecords = medicalRecords
            }
        } catch is DictionaryRepresentableError {
            print("Parsing of medical records failed")
        } catch {
            print("Unknown error during parsing of medical records")
        }
    }
    
    func addMedicalRecord(_ record: MedicalRecord) {
        medicalRecords.append(record)
        
        do {
            try medicalRecordStore?.saveMedicalRecords(medicalRecords, completion: nil)
        } catch {
            print("Unknown error during saving of medical records")
        }
        
        recordsTableView.reloadData()
    }
    
    // MARK: Actions
    
    @IBAction func onAdd() {
        delegate?.medicalRecordsViewControllerDidTapAdd()
    }
}

extension MedicalRecordsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicalRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: MedicalRecordsCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MedicalRecordsCell

        cell?.fillFromMedicalRecord(medicalRecords[indexPath.row])
        
        return cell!
    }
}

extension MedicalRecordsViewController: UITableViewDelegate {
    
}

