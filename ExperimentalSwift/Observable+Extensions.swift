//
//  Observable+Extensions.swift
//  ExperimentalSwift
//
//  Created by PiotrGorzelanyMac on 10/04/2017.
//  Copyright © 2017 rst-it. All rights reserved.
//

import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire
import SwiftyJSON

extension ObservableType {
    
    func observeOnMainScheduler() -> Observable<E> {
        return self.observeOn(MainScheduler.instance)
    }
    
    func observeOnBackgroundScheduler() -> Observable<E> {
        return self.observeOn(SerialDispatchQueueScheduler(qos: DispatchQoS.background))
    }
}

extension ObservableType where E == (HTTPURLResponse, String) {
    
    func validate() -> Observable<(HTTPURLResponse, String) > {
        return self.map({ (response) -> (HTTPURLResponse, String)  in
            let statusCode = response.0.statusCode
            guard statusCode >= 200 && statusCode < 300 else {
                throw CustomError(response: response)
            }
            return response
        })
    }
    
    func toJson() -> Observable<JSON> {
        return self.observeOnBackgroundScheduler()
            .map({JSON.parse($0.1)})
            .observeOnMainScheduler()
    }
}

extension ObservableType {
    
    func handleActivity(with activityHandler: ActivityHandler) -> Observable<E> {
        return self.do(
            onError: { _ in
                activityHandler.hideActivityIndicator()
        }, onCompleted: activityHandler.hideActivityIndicator,
           onSubscribe: activityHandler.showActivityIndicator)
    }
    
    func handleError(with alertHandler: AlertHandler, defaultMessage: String?) -> Observable<E> {
        return self.do(onError: { (error) in
            let message = (error as? CustomError)?.message
            let alertMessage = defaultMessage ?? message ?? error.localizedDescription
            alertHandler.showAlert(withMessage: alertMessage)
        })
    }
}
