//
//  NSRegularExpression.swift
//  AsianTech
//
//  Created by nmint8m on 24.5.17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import Foundation

extension NSRegularExpression {
    func matches(in string: String) -> [NSTextCheckingResult]? {
        let range = NSRange(location: 0, length: string.characters.count)
        return matches(in: string, options: [], range: range)
    }
}
