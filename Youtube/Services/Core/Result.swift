//
//  Result.swift
//  AsianTech
//
//  Created by AsianTech on 4/28/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import ObjectMapper
import Alamofire

extension Result {
    var meta: Meta? {
        if case .success(_) = self, let meta = Mapper<Meta>().map(JSONObject: (value as? JSObject)?["meta"]) {
            return meta
        }
        return nil
    }

    var data: Any? {
        if case .success(_) = self, let data = (value as? JSObject)?["data"] {
            return data
        }
        return nil
    }
}

struct Meta: Mappable {
    var accessToken = ""
    var errorMessages: [String] = []
    var message = ""

    init() { }

    init(map: Map) { }

    mutating func mapping(map: Map) {
        accessToken <- map["access_token"]
        errorMessages <- map["error_messages"]
        message <- map["error_message"]
    }
}
