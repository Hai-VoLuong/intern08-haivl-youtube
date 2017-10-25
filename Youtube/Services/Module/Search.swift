//
//  VideoModel.swift
//  Youtube
//
//  Created by asiantech on 6/21/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RealmSwift
import ObjectMapper

typealias SearchCompletion = ((Channel?, Error?) -> Void)?

class Search {
    class func seach(keyword: String, nextPageToken: String = "", completion: SearchCompletion) {
        var params: [String: Any] = [:]
        params["pageToken"] = nextPageToken
        params["part"] = "snippet"
        params["maxResults"] = 10
        params["q"] = keyword
        params["key"] = youTubeAPIKey

        api.request(method: .get, urlString: Api.Path.search, parameters: params, headers: nil) { (result) in
            switch result {
            case .success(let value):
                if let value = value as? [String: AnyObject] {
                    if let channel = Mapper<Channel>().map(JSON: value) {
                        completion?(channel, nil)
                        return
                    }
                }
                completion?(nil, Api.Error.json)
            case .failure(let error):
                 completion?(nil, error)
            }
        }
    }
}
