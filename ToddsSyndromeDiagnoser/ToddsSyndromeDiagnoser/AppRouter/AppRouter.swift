//
//  AppRouter.swift
//  ToddsSyndromeDiagnoser
//
//  Created by Andrii Mykhailov on 2/5/17.
//  Copyright © 2017 Andrii Mykhailov. All rights reserved.
//

import Foundation
import UIKit
import Diagnoser

class AppRouter {
    let window: UIWindow?
    
    let medicalRecordStore: MedicalRecordStore = LocalMedicalRecordStore()
    let diagnoser: Diagnoser = ToddsSyndromeDiagnoser()
    
    let navigationController: UINavigationController
    let medicalRecordsViewController: MedicalRecordsViewController
    let addPatientViewController: AddPatientViewController
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        navigationController = UINavigationController()
        
        medicalRecordsViewController = MedicalRecordsViewController.storyboardController(store: medicalRecordStore)
        addPatientViewController = AddPatientViewController.storyboardController(diagnoser: diagnoser)
        
        medicalRecordsViewController.delegate = self
        addPatientViewController.delegate = self
    }
    
    func start() {
        navigationController.viewControllers = [medicalRecordsViewController]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

extension AppRouter: MedicalRecordsViewControllerDelegate {
    func medicalRecordsViewControllerDidTapAdd() {
         navigationController.pushViewController(addPatientViewController, animated: true)
    }
}

extension AppRouter: AddPatientViewControllerDelegate {
    func addPatientViewControllerDelegateDidTapAdd(record: MedicalRecord) {
        medicalRecordsViewController.addMedicalRecord(record)
        
        navigationController.popViewController(animated: true)
    }
}
