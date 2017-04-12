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
}
