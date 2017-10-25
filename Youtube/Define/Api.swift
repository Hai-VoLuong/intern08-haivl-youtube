//
//  Api.swift
//  AsianTech
//
//  Created by AsianTech on 3/24/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import Foundation
import Alamofire

class Api {
    struct Path {
        static let baseURL = "https://www.googleapis.com/youtube/v3"
        static let search = Api.Path.baseURL / "search"
    }
}

// MARK: - Implement URLStringConvertible for String
protocol URLStringConvertible {
    var urlString: String { get }
}

protocol ApiPath: URLStringConvertible {
    static var path: String { get }
}

extension URL: URLStringConvertible {
    var urlString: String { return absoluteString }
}

extension Int: URLStringConvertible {
    var urlString: String { return String(describing: self) }
}

fileprivate func / (lhs: URLStringConvertible, rhs: URLStringConvertible) -> String {
    return lhs.urlString + "/" + rhs.urlString
}

extension String: URLStringConvertible {
    var urlString: String { return self }
}

extension CustomStringConvertible where Self: URLStringConvertible {
    var urlString: String { return description }
}
