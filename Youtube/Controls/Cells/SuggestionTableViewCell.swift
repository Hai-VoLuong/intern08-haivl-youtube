//
//  SuggestionTableViewCell.swift
//  Youtube
//
//  Created by asiantech on 6/16/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {

    @IBOutlet weak var keywordLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func config(keyword: Keyword) {
        keywordLabel.text = keyword.keyword
    }
}
