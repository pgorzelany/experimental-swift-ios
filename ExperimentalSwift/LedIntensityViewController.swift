//
//  LedIntensityViewController.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 10/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import UIKit
import RxSwift

class LedIntensityViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var intensitySlider: UISlider!
    
    // MARK: Properties
    
    private let api = RaspberryApi.shared
    private let disposeBag = DisposeBag()
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureController()
    }

    // MARK: Configuration
    
    private func configureController() {
        setBindings()
    }
    
    private func setBindings() {
        intensitySlider.rx.value
            .asObservable()
            .throttle(0.3, scheduler: MainScheduler.instance)
            .map({Double($0)})
            .bindNext({[unowned self] in self.setLedIntensity($0)})
            .addDisposableTo(disposeBag)
    }
    
    // MARK: Helpers
    
    private func setLedIntensity(_ intensity: Double) {
        api.setLedIntensity(intensity)
            .handleError(with: self, defaultMessage: "Could not set intensity")
            .subscribe()
            .addDisposableTo(disposeBag)
    }
}
