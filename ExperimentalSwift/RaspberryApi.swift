//
//  RaspberryApi.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 10/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import Foundation

class RaspberryApi {
    
    // MARK: Endpoints
    
    enum Endpoint: String {
        case test = "test"
        case ledOn = "led/%d/switch_on"
        case ledOff = "led/%d/switch_off"
        case startLedBlink = "led/%d/start_blink"
        case stopLedBlink = "led/%d/stop_blink"
        case ledIntensity = "led/%d/intensity"
    }
    
    // MARK: Shared instance
    
    static let shared = RaspberryApi()
    
    // MARK: Properties
    
    lazy var settings = Settings.shared
    
    // MARK: Private methods
    
    private func getUrl(forEndpoint endpoint: Endpoint, backendUrl: String = Settings.shared.backendUrl, parameters: CVarArg...) -> URL {
        var endpoint = endpoint.rawValue
        if parameters.count > 0  {
            endpoint = String(format: endpoint, arguments: parameters)
        }
        return URL(string: "\(settings.backendUrl)/\(endpoint)")!
    }
    
    // MARK: Public methods
    
    func testConnection(for backendUrl: String) {
        let url = getUrl(forEndpoint: .test, backendUrl: backendUrl)
    }
}
