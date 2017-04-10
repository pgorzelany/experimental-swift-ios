//
//  NetworkActivityHandler.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 10/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import Foundation
import UIKit

protocol ActivityHandler {
    
    func showActivityIndicator()
    func hideActivityIndicator()
}

extension UIViewController: ActivityHandler {
    
    @nonobjc static var activityIndicator: UIActivityIndicatorView?
    
    func showActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        UIViewController.activityIndicator = activityIndicator
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func hideActivityIndicator() {
        UIViewController.activityIndicator?.removeFromSuperview()
        UIViewController.activityIndicator = nil
    }
}
