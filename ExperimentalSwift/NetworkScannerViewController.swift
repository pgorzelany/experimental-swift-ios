//
//  NetworkScannerViewController.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 25/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import UIKit
import MMLanScan

class NetworkScannerViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    fileprivate var devices = [Device]()
    fileprivate var filteredDevices = [Device]()
    lazy fileprivate var networkScanner: MMLANScanner = MMLANScanner(delegate: self)
    fileprivate let cellIdentifier = "deviceCell"
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureController()
    }
    
    // MARK: Configuration
    
    private func configureController() {
        configureTableView()
        networkScanner.start()
    }
    
    private func configureTableView() {
        tableView.estimatedRowHeight = 80
    }
    
    // MARK: Private functions
    
    fileprivate func filterDevices(with phrase: String) {
        guard !phrase.isEmpty else {
            tableView.reloadData()
            filteredDevices = devices
            return
        }
        
        filteredDevices = devices.filter { (device) -> Bool in
            return (device.hostname ?? "").lowercased().contains(phrase.lowercased())
        }
        tableView.reloadData()
    }
    
    fileprivate func navigateToConfigurationController(with device: Device) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ConfigurationViewController") as! ConfigurationViewController
        controller.configure(with: device)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension NetworkScannerViewController: MMLANScannerDelegate {
    
    func lanScanDidFailedToScan() {
        showAlert(withMessage: "Network Scanner failed :(")
    }
    
    func lanScanDidFindNewDevice(_ device: Device!) {
        print("Found new device: \(device)")
        devices.append(device)
        filterDevices(with: "")
        tableView.reloadData()
    }
    
    func lanScanDidFinishScanning(with status: MMLanScannerStatus) {
        print("Finished scanning")
        networkScanner.stop()
    }
    
    func lanScanProgressPinged(_ pingedHosts: Float, from overallHosts: Int) {
        print("Pinged \(pingedHosts) from \(overallHosts)")
    }
}

extension NetworkScannerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDevices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NetworkDeviceTableViewCell
        let device = filteredDevices[indexPath.row]
        cell.configure(with: device)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let device = filteredDevices[indexPath.row]
        navigateToConfigurationController(with: device)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension NetworkScannerViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterDevices(with: searchText)
    }
}
