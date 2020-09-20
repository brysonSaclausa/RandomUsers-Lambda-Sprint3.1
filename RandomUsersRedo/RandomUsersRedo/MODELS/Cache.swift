//
//  Cache.swift
//  RandomUsersRedo
//
//  Created by BrysonSaclausa on 9/18/20.
//  Copyright © 2020 B. All rights reserved.
//

import Foundation

class Cache<Key: Hashable, Value> {
    
    //MARK: - Properties
    
    private var cacheStorage: [Key : Value] = [:]
    let queue = DispatchQueue(label: "QueueCache")

    //MARK: - Functions
    // add items to cache
    func storeInCache(value: Value, for key: Key) {
        queue.async {
            self.cacheStorage[key] = value
        }
    }
    
    // return the associated value from the cache
    func getValue(for key: Key) -> Value? {
        queue.sync {
            guard let storedValue = self.cacheStorage[key] else { return nil }
            return storedValue
        }
    }
    
}
