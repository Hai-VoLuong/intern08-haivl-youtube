//
//  RequestSerializer.swift
//  AsianTech
//
//  Created by AsianTech on 7/8/16.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import Alamofire
import Foundation
import UIKit

extension ApiManager {
    @discardableResult
    func request(method: HTTPMethod,
                 urlString: URLStringConvertible,
                 parameters: [String: Any]? = nil,
                 headers: [String: String]? = nil,
                 completion: Completion?) -> Request? {
        guard Network.shared.isReachable else {
            completion?(.failure(Api.Error.network))
            return nil
        }

        var encoding: ParameterEncoding = URLEncoding.default

        if method == .post {
            encoding = JSONEncoding.default
        }
        let request = Alamofire.request(
            urlString.urlString,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: nil
            ).responseJSON(completion: { (response) in
                completion?(response.result)
            })
        return request
    }
}
