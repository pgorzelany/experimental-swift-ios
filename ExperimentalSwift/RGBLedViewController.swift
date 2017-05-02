//
//  RGBLedViewController.swift
//  ExperimentalSwift
//
//  Created by Piotr Gorzelany on 02/05/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import UIKit
import RxSwift

class RGBLedViewController: UIViewController {
    
    // MARK: Properties
    
    private let raspberryApi = RaspberryApi.shared
    private let disposeBag = DisposeBag()

    // MARK: Actions
    
    @IBAction func redSwitchValueChanged(_ sender: UISwitch) {
        raspberryApi.toggleRGBLedColor(.red)
            .handleActivity(with: self)
            .handleError(with: self, defaultMessage: "Something went wrong while switching led")
            .subscribe()
            .addDisposableTo(disposeBag)
    }
    
    @IBAction func greenSwitchValueChanged(_ sender: UISwitch) {
        raspberryApi.toggleRGBLedColor(.green)
            .handleActivity(with: self)
            .handleError(with: self, defaultMessage: "Something went wrong while switching led")
            .subscribe()
            .addDisposableTo(disposeBag)
    }
    
    @IBAction func blueSwitchValueChanged(_ sender: UISwitch) {
        raspberryApi.toggleRGBLedColor(.blue)
            .handleActivity(with: self)
            .handleError(with: self, defaultMessage: "Something went wrong while switching led")
            .subscribe()
            .addDisposableTo(disposeBag)
    }
}
