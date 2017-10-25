//
//  ApiManager.swift
//  AsianTech
//
//  Created by AsianTech on 4/25/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import Foundation
import Alamofire

typealias JSObject = [String: Any]
typealias JSArray = [JSObject]

typealias Completion = (Result<Any>) -> Void

let api = ApiManager()

final class ApiManager {

    fileprivate init() {}
}
