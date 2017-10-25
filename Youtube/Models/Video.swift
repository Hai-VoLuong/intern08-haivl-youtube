//
//  VideoResponse.swift
//  Youtube
//
//  Created by asiantech on 6/21/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import ObjectMapper
import RealmSwift

final class Video: Object, Mappable {

    dynamic var id = ""
    dynamic var title = ""
    dynamic var thumbnail = ""
    dynamic var publishedTime = ""
    dynamic var content = ""
    dynamic var channelId = ""
    dynamic var isFavorite = false

    override static func primaryKey() -> String? {
        return "id"
    }

    required convenience init(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map["id.videoId"]
        title <- map["snippet.title"]
        content <- map["snippet.description"]
        channelId <- map["snippet.channelId"]
        publishedTime <- map["snippet.publishedAt"]
        thumbnail <- map["snippet.thumbnails.default.url"]
    }
}
