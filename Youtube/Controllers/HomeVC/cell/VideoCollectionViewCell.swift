//
//  VideoCollectionViewCell.swift
//  Youtube
//
//  Created by asiantech on 6/1/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import UIKit
import Haneke

class VideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var timeLabel: UILabel!

    func config(video: Video) {
        if let URL = URL(string: video.thumbnail) {
            thumbnailImageView.hnk_setImageFromURL(URL)
        }
        timeLabel.text = video.publishedTime
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
}
