//
//  ResponseSerializer.swift
//  AsianTech
//
//  Created by AsianTech on 4/25/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import Alamofire
import ObjectMapper
import SwiftUtils

// MARK: - Request
extension Request {
    static func responseJSONSerializer(log: Bool = true,
                                       response: HTTPURLResponse?,
                                       data: Data?,
                                       error: Error?) -> Result<Any> {
        guard let response = response else {
            return .failure(NSError(status: .requestTimeout))
        }

        if let error = error {
            return .failure(error)
        }

        let statusCode = response.statusCode

        if 204...205 ~= statusCode { // empty data status code
            return .success([:])
        }

        guard 200...299 ~= statusCode else {
            if let status = HTTPStatus(rawValue: statusCode) {
                switch status {
                case .unauthorized, .noResponse, .serviceUnavailable, .gatewayTimeout:
                    break
                default: break
                }
            }

            var err: NSError!
            if let json = data?.toJSON() as? JSObject, let meta = json["meta"] as? JSObject,
                let errors = meta["error_messages"] as? [String], errors.isNotEmpty, let message = errors.first {
                err = NSError(message: message)
            } else if let status = HTTPStatus(code: statusCode) {
                err = NSError(domain: Api.Path.baseURL.host, status: status)
            } else {
                err = NSError(domain: Api.Path.baseURL.host,
                              code: statusCode,
                              message: "Unknown HTTP status code received (\(statusCode)).")
            }

            return .failure(err)
        }

        guard let data = data, let json = data.toJSON() else {
            return Result.failure(Api.Error.json)
        }

        return .success(json)
    }
}

// MARK: - DataRequest
extension DataRequest {
    static func responseSerializer() -> DataResponseSerializer<Any> {
        return DataResponseSerializer { _, response, data, error in
            return Request.responseJSONSerializer(log: true, response: response, data: data, error: error)
        }
    }

    @discardableResult
    func responseJSON(queue: DispatchQueue? = nil, completion: @escaping (DataResponse<Any>) -> Void) -> Self {
        return response(responseSerializer: DataRequest.responseSerializer(), completionHandler: completion)
    }
}
