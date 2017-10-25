//
//  Util.swift
//  AsianTech
//
//  Created by AsianTech on 2017/04/12.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import UIKit
import XCGLogger

/// logger Property

/*
 // sample code
 log?.verbose("A verbose message, usually useful when working on a specific problem")
 log?.debug("A debug message")
 log?.info("An info message, probably useful to power users looking in console.app")
 log?.warning("A warning message, may indicate a possible error")
 log?.error("An error occurred, but it's recoverable, just info about what happened")
 log?.severe("A severe error occurred, we are likely about to crash now")
 
 https://github.com/DaveWoodCom/XCGLogger
 */
public let log: XCGLogger? = {
    #if RELEASE
        return nil
    #else
        let log = XCGLogger.default
        log.setup(level: .verbose, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: nil, fileLevel: .debug)
        return log
    #endif
}()
