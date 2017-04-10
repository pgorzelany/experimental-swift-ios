//
//  CustomError.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 10/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct CustomError: Error {
    
    // MARK: Properties
    
    let code: Int?
    let message: String
    
    init(code: Int? = nil, message: String) {
        self.code = code
        self.message = message
    }
    
    init(response: (HTTPURLResponse, String)) {
        let code = response.0.statusCode
        let responseJson = JSON(response.1)
        let message = responseJson["message"].string ?? "Unknown error"
        self.init(code: code, message: message)
    }
}
