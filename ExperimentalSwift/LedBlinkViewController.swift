//
//  LedBlinkViewController.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 10/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import UIKit
import DesignableViews
import RxSwift

class LedBlinkViewController: UIViewController {
    
    // MARK: Properties
    
    private let api = RaspberryApi.shared
    private let disposeBag = DisposeBag()
    
    // MARK: Actions
    
    @IBAction func switchLedOnButtonTouched(_ sender: BasicButton) {
        api.switchLedOn()
            .handleActivity(with: self)
            .handleError(with: self, defaultMessage: "Something went wrong while switching led")
            .subscribe()
            .addDisposableTo(disposeBag)
        
    }
    
    @IBAction func switchLedOffButtonTouched(_ sender: BasicButton) {
        api.switchLedOff()
            .handleActivity(with: self)
            .handleError(with: self, defaultMessage: "Something went wrong while switching led")
            .subscribe()
            .addDisposableTo(disposeBag)
    }

    @IBAction func startLedBlinkButtonTouched(_ sender: BasicButton) {
        api.startLedBlink()
            .handleActivity(with: self)
            .handleError(with: self, defaultMessage: "Something went wrong while switching led")
            .subscribe()
            .addDisposableTo(disposeBag)
    }
    
    @IBAction func stopLedBlinkButtonTouched(_ sender: BasicButton) {
        api.stopLedBlink()
            .handleActivity(with: self)
            .handleError(with: self, defaultMessage: "Something went wrong while switching led")
            .subscribe()
            .addDisposableTo(disposeBag)
    }
}
