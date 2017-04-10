//
//  ConfigurationViewController.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 10/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import UIKit
import DesignableViews

class ConfigurationViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var raspberryAddressTextField: UITextField!
    
    // MARK: Properties
    
    private var settings = Settings.shared

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    
    @IBAction func saveButtonTouched(_ sender: UIBarButtonItem) {
        settings.backendUrl = raspberryAddressTextField.text ?? ""
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func testConnectionButtonTouched(_ sender: BasicButton) {
        
    }
    
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
