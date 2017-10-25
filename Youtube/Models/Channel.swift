//
//  ChannelResponse.swift
//  Youtube
//
//  Created by asiantech on 6/21/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import ObjectMapper
import RealmSwift
import ObjectMapper_RealmSwift

final class Channel: Object, Mappable {
    dynamic var nextPageToken = ""
    dynamic var prevPageToken = ""
    var videos = List<Video>()

    required convenience init(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        nextPageToken <- map["nextPageToken"]
        prevPageToken <- map["prevPageToken"]
        videos <- map["items"]
    }
}
