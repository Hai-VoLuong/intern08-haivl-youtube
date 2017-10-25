//
//  HeaderTableView.swift
//  Youtube
//
//  Created by asiantech on 6/12/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import UIKit

class HeaderTableView: UITableViewHeaderFooterView {

    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLable: UILabel!
    @IBOutlet private weak var subTitleLable: UILabel!
    @IBOutlet private weak var publishedAtLable: UILabel!
    @IBOutlet private weak var descriptionLable: UILabel!

    func config(video: Video) {
        if let URL = URL(string: video.thumbnail) {
            thumbnailImageView.hnk_setImageFromURL(URL)
        }
        titleLable.text = video.title
        publishedAtLable.text = video.publishedTime
        subTitleLable.text = video.title
        descriptionLable.text = video.content
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
}
