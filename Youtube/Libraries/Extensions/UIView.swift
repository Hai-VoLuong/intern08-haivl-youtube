//
//  UIView.swift
//  AsianTech
//
//  Created by AsianTech on 3/21/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import UIKit

extension UIView {

    func makeShadow(color: UIColor, shadowOffset: CGSize, opacity: Float) {
        let shadowPath = UIBezierPath(rect: bounds)
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = opacity
        layer.shadowPath = shadowPath.cgPath
    }
}
