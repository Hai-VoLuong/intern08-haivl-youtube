//
//  Bundle.swift
//  AsianTech
//
//  Created by AsianTech on 5/19/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import Foundation

// MARK: - Bundle
extension Bundle {
    var currentShortVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
}
