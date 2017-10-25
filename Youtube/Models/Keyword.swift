//
//  keyWord.swift
//  Youtube
//
//  Created by asiantech on 6/19/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import Foundation
import RealmSwift

final class Keyword: Object {
    dynamic var keyword = ""
    dynamic var lastTimeUse = Date()
    override static func primaryKey() -> String? {
        return "keyword"
    }
}
