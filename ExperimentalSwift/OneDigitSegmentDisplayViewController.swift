//
//  OneDigitSegmentDisplayViewController.swift
//  ExperimentalSwift
//
//  Created by Piotr Gorzelany on 01/05/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import UIKit
import DesignableViews
import RxSwift

class OneDigitSegmentDisplayViewController: UIViewController {

    // MARK: StoryboardInstantiable
    
    static let storyboardId = "Main"
    
    // MARK: Outlets
    
    @IBOutlet weak var digitTextField: UITextField!
    
    
    // MARK: Properties
    
    private let rasberryApi = RaspberryApi.shared
    private let disposeBag = DisposeBag()

    // MARK: Actions
    
    @IBAction func displayDigit(_ sender: BasicButton) {
        if let digitString = digitTextField.text, let digit = Int(digitString) {
            rasberryApi.displayDigit(digit)
                .handleActivity(with: self)
                .handleError(with: self, defaultMessage: "Something went wrong while setting digit display")
                .subscribe()
                .addDisposableTo(disposeBag)
        }
    }
    
    @IBAction func switchOffButtonTouched(_ sender: BasicButton) {
        rasberryApi.displaySegmentSwitchOff()
            .handleActivity(with: self)
            .handleError(with: self, defaultMessage: "Something went wrong while switching led")
            .subscribe()
            .addDisposableTo(disposeBag)
    }
    
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    // MARK: Support
    
    // MARK: Data
    
    // MARK: Appearance

}
