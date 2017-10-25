//
//  Error.swift
//  AsianTech
//
//  Created by AsianTech on 4/25/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUtils

typealias Network = NetworkReachabilityManager

// MARK: - Network
extension Network {
    static let shared: Network = {
        guard let manager = Network() else {
            fatalError("Cannot alloc network reachability manager!")
        }
        return manager
    }()
}

// MARK: - API
extension Api {
    struct Error {
        static let network = NSError(domain: Api.Path.baseURL.host, status: HTTPStatus.requestTimeout, message: Strings.internetOffline)
        static let authen = NSError(domain: Api.Path.baseURL.host, status: HTTPStatus.unauthorized)
        static let json = NSError(domain: NSCocoaErrorDomain, code: 3_840, message: "The operation couldn’t be completed.")
        static let apiKey = NSError(domain: Api.Path.baseURL.host, status: HTTPStatus.badRequest)
    }
}

// MARK: - Error
extension Error {
    func show() {
        let this = self as NSError
        this.show()
    }
}

// MARK: - NSError
extension NSError {
    func show() { }
}
