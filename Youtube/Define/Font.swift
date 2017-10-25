//
//  Font.swift
//  AsianTech
//
//  Created by AsianTech on 3/10/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import UIKit

let fontScale = loadFontScale()

func loadFontScale() -> CGFloat {
    return Ratio.widthIPhone6
}

protocol Fontable {
    static var name: String { get }
}

// MARK: - Fontable
extension Fontable {
    static func font(type: String, _ size: CGFloat) -> UIFont {
        let fontName = name + type
        if let font = UIFont(name: fontName, size: size) {
            return font
        }
        log?.debug(fontName + " is invalid font")
        return UIFont.systemFont(ofSize: size)
    }
}

protocol JapaneseFontTypeable {
    static func w3(size: CGFloat, scale: CGFloat) -> UIFont
    static func w6(size: CGFloat, scale: CGFloat) -> UIFont
}

protocol LatinFontTypeable {
    static func none(size: CGFloat, scale: CGFloat) -> UIFont
    static func bold(size: CGFloat, scale: CGFloat) -> UIFont
    static func regular(size: CGFloat, scale: CGFloat) -> UIFont
    static func medium(size: CGFloat, scale: CGFloat) -> UIFont
}

struct Font {
    struct Hiragino: Fontable, JapaneseFontTypeable {
        static var name: String {
            return "HiraginoSans"
        }
    }
    struct HelveticaNeue: Fontable, LatinFontTypeable {
        static var name: String {
            return "HelveticaNeue"
        }
    }
}

// MARK: - JapaneseFontTypeable
extension JapaneseFontTypeable where Self: Fontable {
    static func w3(size: CGFloat, scale: CGFloat = fontScale) -> UIFont {
        return font(type: "-W3", size * scale)
    }

    static func w6(size: CGFloat, scale: CGFloat = fontScale) -> UIFont {
        return font(type: "-W6", size * scale)
    }
}
// MARK: - LatinFontTypeable
extension LatinFontTypeable where Self: Fontable {
    static func none(size: CGFloat, scale: CGFloat = fontScale) -> UIFont {
        return font(type: "", size * scale)
    }

    static func bold(size: CGFloat, scale: CGFloat = fontScale) -> UIFont {
        return font(type: "-Bold", size * scale)
    }

    static func regular(size: CGFloat, scale: CGFloat = fontScale) -> UIFont {
        return font(type: "-Regular", size * scale)
    }

    static func medium(size: CGFloat, scale: CGFloat = fontScale) -> UIFont {
        return font(type: "-Medium", size * scale)
    }
}
