//
//  AddPatientViewController.swift
//  ToddsSyndromeDiagnoser
//
//  Created by Andrii Mykhailov on 2/5/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import UIKit
import Diagnoser

class AddPatientViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var genderControl: UISegmentedControl!
    @IBOutlet var migrainesSwitch: UISwitch!
    @IBOutlet var usesDrugsSwitch: UISwitch!
    
    fileprivate var diagnoser: Diagnoser!
    fileprivate var patient: Patient?

    fileprivate let pickerAges: [String] = (0...99).map{("\($0)")}
    
    weak var delegate: AddPatientViewControllerDelegate?
    
    static func storyboardController(diagnoser: Diagnoser) -> AddPatientViewController {
        let identifier = String(describing: self)
        let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: identifier)
        
        let addPatientViewController = viewController as! AddPatientViewController
        addPatientViewController.diagnoser = diagnoser
        
        return addPatientViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        ageTextField.inputAccessoryView = pickerView
        
        diagnoser = ToddsSyndromeDiagnoser()
    }

    // MARK: Actions
    @IBAction func onAdd(_ sender: Any) {
        let patient = Patient(name: nameTextField.text ?? "",
                              age: Int(ageTextField.text ?? "0") ?? 0,
                              gender: genderControl.selectedSegmentIndex == 0 ? .male : .female,
                              hasMigraines: migrainesSwitch.isOn,
                              usesDrugs: usesDrugsSwitch.isOn)
        
        let syndrome = diagnoser.diagnose(patient: patient)
        
        let medicalRecord = MedicalRecord(patient: patient)
        medicalRecord.addSyndrome(syndrome)
        
        delegate?.addPatientViewControllerDelegateDidTapAdd(record: medicalRecord)
    }
    
    @IBAction func onDone() {
        view.endEditing(true)
    }
}

extension AddPatientViewController : UIPickerViewDelegate {
     public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerAges[row]
    }
    
     public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ageTextField.text = pickerAges[row]
    }
}

extension AddPatientViewController : UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerAges.count
    }
}
