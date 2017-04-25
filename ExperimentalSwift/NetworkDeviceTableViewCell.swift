//
//  NetworkDeviceTableViewCell.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 25/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import UIKit
import DesignableViews
import MMLanScan

class NetworkDeviceTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var hostnameLabel: BasicLabel!
    @IBOutlet weak var ipAddressLabel: BasicLabel!
    @IBOutlet weak var macAddressLabel: BasicLabel!
    @IBOutlet weak var subnetMaskLabel: BasicLabel!
    @IBOutlet weak var brandLabel: BasicLabel!
    
    // MARK: Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Configuration
    
    func configure(with device: Device) {
        hostnameLabel.text = device.hostname
        ipAddressLabel.text = device.ipAddress
        macAddressLabel.text = device.macAddress
        subnetMaskLabel.text = device.subnetMask
        brandLabel.text = device.brand
    }
}
