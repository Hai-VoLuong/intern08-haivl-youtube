//
//  NSUserDefault.swift
//  AsianTech
//
//  Created by AsianTech on 3/10/17.
//  Copyright © 2017 AsianTech. All rights reserved.
//

import Foundation

public let userDefaults = UserDefaults.standard

public class Keys {

    init() {}
}

public class Key<ValueType>: Keys {

    public let name: String
    public init(name: String) {
        self.name = name
    }
}

// - UserDefaults
extension UserDefaults {
    class Result {

        private let defaults: UserDefaults
        private let key: String

        init(defaults: UserDefaults, key: String) {
            self.defaults = defaults
            self.key = key
        }
        // MARK: Getters
        var object: Any? { return defaults.object(forKey: key) }
        var string: String? { return defaults.string(forKey: key) }
        var array: [Any]? { return defaults.array(forKey: key) }
        var dictionary: [String : Any]? { return defaults.dictionary(forKey: key) }
        var data: Data? { return defaults.data(forKey: key) }
        var date: NSDate? { return object as? NSDate }
        var integer: Int { return defaults.integer(forKey: key) }
        var double: Double { return defaults.double(forKey: key) }
        var bool: Bool { return defaults.bool(forKey: key) }
        var float: Float { return defaults.float(forKey: key) }
    }

    @nonobjc subscript(key: String) -> Result {
        return Result(defaults: self, key: key)
    }

    @nonobjc subscript(key: String) -> Any? {
        get {
            let result: Result = self[key]
            return result
        }
        set {
            switch newValue {
            case let v as Int: set(v, forKey: key)
            case let v as Double: set(v, forKey: key)
            case let v as Bool: set(v, forKey: key)
            case let v as Float: set(v, forKey: key)
            case let v as NSURL: set(v, forKey: key)
            case nil: removeObject(forKey: key)
            default: set(newValue, forKey: key)
            }
            userDefaults.synchronize()
        }
    }

    public func setValue<T>(value: Any?, key: Key<T>) {
        self[key.name] = value
    }

    public func hasKey<T>(key: Key<T>) -> Bool {
        return object(forKey: key.name) != nil
    }

    public func removeValue<T>(key: Key<T>) {
        removeObject(forKey: key.name)
    }

    subscript(key: Key<String>) -> String? {
        get {
            return string(forKey: key.name)
        }
        set { setValue(value: newValue, key: key) }
    }
    subscript(key: Key<Bool>) -> Bool {
        get { return bool(forKey: key.name) }
        set { setValue(value: newValue, key: key) }
    }
    subscript(key: Key<Int>) -> Int {
        get { return integer(forKey: key.name) }
        set { setValue(value: newValue, key: key) }
    }
    subscript(key: Key<Double>) -> Double {
        get { return double(forKey: key.name) }
        set { setValue(value: newValue, key: key) }
    }
    subscript(key: Key<Float>) -> Float {
        get { return float(forKey: key.name) }
        set { setValue(value: newValue, key: key) }
    }
    subscript(key: Key<Any>) -> Any? {
        get { return object(forKey: key.name) }
        set { setValue(value: newValue, key: key) }
    }
    subscript(key: Key<[String]>) -> [String]? {
        get { return stringArray(forKey: key.name) }
        set { setValue(value: newValue, key: key) }
    }
    subscript(key: Key<[Any]>) -> [Any]? {
        get { return array(forKey: key.name) }
        set { setValue(value: newValue, key: key) }
    }
    subscript(key: Key<[String: Any]>) -> [String: Any]? {
        get { return dictionary(forKey: key.name) }
        set { setValue(value: newValue, key: key) }
    }
    subscript(key: Key<NSDate>) -> NSDate? {
        get { return object(forKey: key.name) as? NSDate }
        set { setValue(value: newValue, key: key) }
    }
    subscript(key: Key<URL>) -> URL? {
        get { return url(forKey: key.name) }
        set { setValue(value: newValue, key: key) }
    }
    subscript(key: Key<Data>) -> Data? {
        get { return data(forKey: key.name) }
        set { setValue(value: newValue, key: key) }
    }
}
