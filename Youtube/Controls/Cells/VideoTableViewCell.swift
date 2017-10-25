//
//  VideoTableViewCell.swift
//  Youtube
//
//  Created by asiantech on 6/2/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import UIKit

protocol VideoTableViewCellDelegate: class {
    func videoTableViewCell(_ cell: VideoTableViewCell, didUpdateFavoriteVideo: Video)
}

class VideoTableViewCell: UITableViewCell {
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    weak var delegate: VideoTableViewCellDelegate?
    private var video: Video!

    func config(video: Video) {
        self.video = video
        if let URL = URL(string: video.thumbnail) {
            thumbnailImageView.hnk_setImageFromURL(URL)
        }
        if video.isFavorite {
            favoriteButton.setImage(#imageLiteral(resourceName: "ic_bt_video_like"), for: .normal)
        } else {
            favoriteButton.setImage(#imageLiteral(resourceName: "ic_bt_video_like_while"), for: .normal)
        }

        titleLabel.text = video.title
        timeLabel.text = video.publishedTime
        descriptionLabel.text = video.content
    }

    @IBAction func favoriteButtonTouchUpInside(_ sender: UIButton) {
        delegate?.videoTableViewCell(self, didUpdateFavoriteVideo: video)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
}
