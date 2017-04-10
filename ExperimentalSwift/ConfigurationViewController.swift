//
//  ConfigurationViewController.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 10/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import UIKit
import DesignableViews
import RxSwift

class ConfigurationViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var raspberryAddressTextField: UITextField!
    
    // MARK: Properties
    
    private var settings = Settings.shared
    private var api = RaspberryApi.shared
    private let disposeBag = DisposeBag()

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        raspberryAddressTextField.text = settings.backendUrl
    }
    
    // MARK: Actions
    
    @IBAction func saveButtonTouched(_ sender: UIBarButtonItem) {
        settings.backendUrl = raspberryAddressTextField.text ?? ""
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func testConnectionButtonTouched(_ sender: BasicButton) {
        let backendUrl = raspberryAddressTextField.text ?? ""
        api.testConnection(for: backendUrl)
            .handleActivity(with: self)
            .handleError(with: self, defaultMessage: nil)
            .bindNext({[unowned self] in self.handleTestResponse()})
            .addDisposableTo(disposeBag)
    }
    
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: Private methods
    
    private func handleTestResponse() {
        showAlert(withMessage: "Connection OK!")
    }
}
