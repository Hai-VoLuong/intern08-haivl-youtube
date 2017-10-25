//
//  String.swift
//  AsianTech
//
//  Created by AsianTech on 3/22/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import Foundation
import SwiftUtils

extension String {
    var isNotEmpty: Bool {
        return !isEmpty
    }

    func contentHeight(contentWidth: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: contentWidth, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin,
                                            attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }

    enum Process {
        case encode
        case decode
    }

    var len: Int { return characters.count }
    var host: String? { return (try? asURL())?.host }

    func base64(_ method: Process) -> String? {
        switch method {
        case .encode:
            guard let data = data(using: .utf8) else { return nil }
            return data.base64EncodedString()
        case .decode:
            guard let data = Data(base64Encoded: self) else { return nil }
            return String(data: data, encoding: .utf8)
        }
    }

    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }

    func match(_ pattern: String) -> NSRegularExpression? {
        let regularExpession = try? NSRegularExpression(pattern: pattern, options: [])
        return regularExpession
    }
}
