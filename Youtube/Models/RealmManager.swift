//
//  RealmManager.swift
//  Youtube
//
//  Created by asiantech on 7/6/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {

    static let shared: RealmManager = RealmManager()

    private init() {}

    // MARK: - func add video into history
    func addHistory(video: Video) {
        do {
            let realm = try Realm()
            try realm.write {
                if realm.object(ofType: Video.self, forPrimaryKey: video.id) != nil {
                    return
                } else {
                    realm.create(Video.self, value: video, update: true)
                }
            }
        } catch {}
    }

    // MARK: - func add video into favorite
    func addFavorite(video: Video) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(Video.self, value: video, update: true).isFavorite = true
            }
        } catch {}
    }

    // MARK: - func delete video
    func delete(video: Video) {
        do {
            let realm = try Realm()
            if let vd = realm.object(ofType: Video.self, forPrimaryKey: video.id) {
                try realm.write {
                    realm.delete(vd)
                }
            }
        } catch {}
    }

    // MARK: - func find video id is favorite
    func isFavorited(video: Video) -> Bool {
        do {
            let realm = try Realm()
            if let vd = realm.object(ofType: Video.self, forPrimaryKey: video.id) {
                if vd.isFavorite {
                    return true
                }
            }
        } catch {}
        return false
    }

    // MARK: - func read list video
    func getAllVideo() -> [Video] {
        var listVideo: [Video] = []
        do {
            let realm = try Realm()
            let videos = realm.objects(Video.self)
            listVideo = Array(videos)
        } catch {}
        return listVideo
    }

    // MARK: - func read list video is favorite
    func getAllFavoriteVideo() -> [Video] {
        var videoList: [Video] = []
        do {
            let realm = try Realm()
            let videos = realm.objects(Video.self).filter("isFavorite = true")
            videoList = Array(videos)
        } catch {}
        return videoList
    }

    // MARK: - func delete all video
    func deleteAllVideo() {
        do {
            let realm = try Realm()
            let videos = realm.objects(Video.self)
            try realm.write {
                realm.delete(videos)
            }
        } catch {}
    }

    // MARK: - func delete all video favorite
    func deleteAllFavoriteVideo() {
        do {
            let realm = try Realm()
            let videos = realm.objects(Video.self).filter("isFavorite = true")
            try realm.write {
                realm.delete(videos)
            }
        } catch {}
    }

    // MARK: - func add keyword
    func addKeyword(_ keyword: Keyword) {
        do {
            let realm = try Realm()
            let kw = realm.object(ofType: Keyword.self, forPrimaryKey: keyword.keyword)
            if kw == nil {
                try realm.write {
                    realm.add(keyword)
                }
            }
        } catch {}
    }

    // MARK: - func read list keyword
    func getAllKeywords() -> [Keyword] {
        var listKeywords: [Keyword] = []
        do {
            let realm = try Realm()
            let keywords = realm.objects(Keyword.self)
            listKeywords = Array(keywords)
        } catch {}
        return listKeywords
    }

    // MARK: - func delete keyword
    func deleteKeyword(_ keyword: Keyword) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(keyword)
            }
        } catch {}
    }
}
