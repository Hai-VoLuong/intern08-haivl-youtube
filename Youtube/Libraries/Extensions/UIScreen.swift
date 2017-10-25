//
//  UIScreen.swift
//  AsianTech
//
//  Created by AsianTech on 3/10/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import UIKit

let ratio = Ratio.widthIPhone6

public struct Ratio {
    public static let widthIPhone4 = UIScreen.mainWidth / UIScreen.widthIphone4And5
    public static let widthIPhone5 = UIScreen.mainWidth / UIScreen.widthIphone4And5
    public static let widthIPhone6 = UIScreen.mainWidth / UIScreen.widthIphone6
    public static let widthIPhone6P = UIScreen.mainWidth / UIScreen.widthIphone6P
    public static let heightIPhone4 = UIScreen.mainHeight / UIScreen.heightIphone4
    public static let heightIPhone5 = UIScreen.mainHeight / UIScreen.heightIphone5
    public static let heightIPhone6 = UIScreen.mainHeight / UIScreen.heightIphone6
    public static let heightIPhone6P = UIScreen.mainHeight / UIScreen.heightIphone6P
}
//
extension UIScreen {

    public static var mainWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    public static var mainHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    public static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }

    public static var statusBarWidth: CGFloat {
        return UIApplication.shared.statusBarFrame.size.width
    }

    public static var widthIphone4And5: CGFloat {
        return 320
    }
    /// Get the screen width iPhone 6
    public static var widthIphone6: CGFloat {
        return 375
    }
    /// Get the screen width iPhone 6 plus
    public static var widthIphone6P: CGFloat {
        return 414
    }
    /// Get the screen height iPhone 4
    public static var heightIphone4: CGFloat {
        return 480
    }
    /// Get the screen height iPhone 5
    public static var heightIphone5: CGFloat {
        return 568
    }
    /// Get the screen height iPhone 6
    public static var heightIphone6: CGFloat {
        return 667
    }
    /// Get the screen height iPhone 6 plus
    public static var heightIphone6P: CGFloat {
        return 736
    }

    public static var isPhone4: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && UIScreen.mainHeight == UIScreen.heightIphone4
    }

    public static var isPhone5: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && UIScreen.mainHeight == UIScreen.heightIphone5
    }

    public static var isPhone6: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && UIScreen.mainHeight == UIScreen.heightIphone6
    }

    public static var isPhone6P: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && UIScreen.mainHeight == UIScreen.heightIphone6P
    }

    public static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad && UIScreen.mainHeight > UIScreen.heightIphone6P
    }
}
