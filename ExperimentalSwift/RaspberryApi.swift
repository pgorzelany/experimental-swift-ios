//
//  RaspberryApi.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 10/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import Foundation
import RxAlamofire
import Alamofire
import RxSwift
import SwiftyJSON

class RaspberryApi {
    
    // MARK: Endpoints
    
    enum Endpoint: String {
        case test = ""
        case ledOn = "led/switch_on"
        case ledOff = "led/switch_off"
        case startLedBlink = "led/start_blink"
        case stopLedBlink = "led/stop_blink"
        case ledIntensity = "led/intensity"
        case oneDigitDisplay = "digitSegment/%d"
        case oneDigitDisplayOff = "digitSegment/switchOff"
        case toggleRGBLed = "rgbLed/%@/toggle"
    }
    
    // MARK: Shared instance
    
    static let shared = RaspberryApi()
    
    // MARK: Properties
    
    lazy var settings = Settings.shared
    
    // MARK: Private methods
    
    private func getUrl(forEndpoint endpoint: Endpoint, backendUrl: String = "\(Settings.shared.backendUrl):\(Settings.shared.backendPort)", parameters: CVarArg...) -> URL {
        var endpoint = endpoint.rawValue
        if parameters.count > 0  {
            endpoint = String(format: endpoint, arguments: parameters)
        }
        return URL(string: "http://\(backendUrl)/\(endpoint)")!
    }
    
    private func performRequest(_ method: HTTPMethod, url: URL, parameters: [String: Any]?, encoding: ParameterEncoding, headers: [String: String]?) -> Observable<JSON> {
        // Request string is used because if requestJSON was used, there was a problem with missing status code in response.
        return RxAlamofire.requestString(method, url, parameters: parameters, encoding: encoding, headers: headers)
            .validate()
            .retry(2)
            .toJson()
            .observeOnMainScheduler()
    }
    
    // MARK: Public methods
    
    func testConnection(for backendUrl: String) -> Observable<Void> {
        let url = getUrl(forEndpoint: .test, backendUrl: backendUrl)
        
        return performRequest(.get, url: url, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .map({_ in return})
    }
    
    func switchLedOn() -> Observable<Void> {
        let url = getUrl(forEndpoint: .ledOn)
        
        return performRequest(.patch, url: url, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .map({_ in return})
    }
    
    func switchLedOff() -> Observable<Void> {
        let url = getUrl(forEndpoint: .ledOff)
        
        return performRequest(.patch, url: url, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .map({_ in return})
    }
    
    func startLedBlink() -> Observable<Void> {
        let url = getUrl(forEndpoint: .startLedBlink)
        
        return performRequest(.patch, url: url, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .map({_ in return})
    }
    
    func stopLedBlink() -> Observable<Void> {
        let url = getUrl(forEndpoint: .stopLedBlink)
        
        return performRequest(.patch, url: url, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .map({_ in return})
    }
    
    func setLedIntensity(_ intensity: Double) -> Observable<Void> {
        let url = getUrl(forEndpoint: .ledIntensity)
        let params = [
            "intensity": intensity
        ]
        
        return performRequest(.patch, url: url, parameters: params, encoding: URLEncoding.queryString, headers: nil)
            .map({_ in return})
    }
    
    func displayDigit(_ digit: Int) -> Observable<Void> {
        let url = getUrl(forEndpoint: .oneDigitDisplay, parameters: digit)
        
        return performRequest(.patch, url: url, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .map({_ in return})
    }
    
    func displaySegmentSwitchOff() -> Observable<Void> {
        let url = getUrl(forEndpoint: .oneDigitDisplayOff)
        
        return performRequest(.patch, url: url, parameters: nil, encoding: URLEncoding.default, headers: nil)
                .map({_ in return})
    }
    
    func toggleRGBLedColor(_ color: RGBColor) -> Observable<Void> {
        let url = getUrl(forEndpoint: .toggleRGBLed, parameters: color.rawValue)
        
        return performRequest(.patch, url: url, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .map({_ in return})
    }
}
