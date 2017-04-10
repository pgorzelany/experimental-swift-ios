//
//  ErrorHandler.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 10/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import Foundation
import UIKit

protocol AlertHandler {
    
    func showAlert(withMessage message: String)
}

extension UIViewController: AlertHandler {
    
    private func createAlertController(withTitle title: String?, message: String?, actions: [UIAlertAction]) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.view.tintColor = UIColor.customBlue
        actions.forEach(alert.addAction)
        return alert
    }
    
    func showAlert(withTitle title: String?, message: String?, actions: [UIAlertAction]) {
        // Check if the view controller is already presenting an alert, only show one alert at a time
        guard (presentedViewController as? UIAlertController) == nil else {
            return
        }
        let alert = createAlertController(withTitle: title, message: message, actions: actions)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(withTitle title: String?, message: String?, completion: (() -> Void)?) {
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { _ in
            completion?()
        }
        showAlert(withTitle: title, message: message, actions: [okAction])
    }
    
    func showAlert(withMessage message: String) {
        showAlert(withTitle: nil, message: message, completion: nil)
    }
}
