//
//  DateFormatter.swift
//  AsianTech
//
//  Created by nmint8m on 27.5.17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import Foundation

extension DateFormatter {
    func stringFromDate(_ date: Date, withFormat format: String) -> String {
        dateFormat = format
        return string(from: date)
    }
}
