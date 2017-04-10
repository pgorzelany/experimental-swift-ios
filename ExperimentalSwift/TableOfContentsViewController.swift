//
//  TableOfContentsViewController.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 07/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import UIKit

class TableOfContentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "TOC", style: .plain, target: nil, action: nil)
    }
}
