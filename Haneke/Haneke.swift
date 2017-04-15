//
//  Haneke.swift
//  Haneke
//
//  Created by Hermes Pique on 9/9/14.
//  Copyright (c) 2014 Haneke. All rights reserved.
//

import UIKit

public struct HanekeGlobals {
    
    public static let Domain = "io.haneke"

    private static var sCacheDir: String!
    public static func getDefaultCacheBase(cacheName: String, formatName: String) -> String {
        if sCacheDir == nil {
            let cacheDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
            sCacheDir = (cacheDir as NSString).appendingPathComponent(HanekeGlobals.Domain)
        }
        let cacheBase = (sCacheDir as NSString).appendingPathComponent(cacheName)
        let defaultCachePath = (cacheBase as NSString).appendingPathComponent(formatName)
        return defaultCachePath
    }
    
}

public struct Shared {
    
    public static var imageCache : Cache<UIImage> {
        struct Static {
            static let name = "shared-images"
            static let cache = Cache<UIImage>(name: name)
        }
        return Static.cache
    }
    
    public static var dataCache : Cache<Data> {
        struct Static {
            static let name = "shared-data"
            static let cache = Cache<Data>(name: name)
        }
        return Static.cache
    }
    
    public static var stringCache : Cache<String> {
        struct Static {
            static let name = "shared-strings"
            static let cache = Cache<String>(name: name)
        }
        return Static.cache
    }
    
    public static var JSONCache : Cache<JSON> {
        struct Static {
            static let name = "shared-json"
            static let cache = Cache<JSON>(name: name)
        }
        return Static.cache
    }
}

func errorWithCode(_ code: Int, description: String) -> Error {
    let userInfo = [NSLocalizedDescriptionKey: description]
    return NSError(domain: HanekeGlobals.Domain, code: code, userInfo: userInfo) as Error
}
