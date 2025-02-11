//
//  UserDefaultStorageImpl.swift
//  MovieNote
//
//  Created by YOUJIM on 2/11/25.
//


import Foundation

class UserDefaultStorageImpl: UserDefaultStorage {
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func setValue<T>(_ value: T, forKey key: String) where T : Decodable, T : Encodable {
        if let data = try? JSONEncoder().encode(value) {
            userDefaults.set(data, forKey: key)
        }
    }
    
    func getValue<T: Codable>(forKey key: String) -> T? {
        guard let data = userDefaults.data(forKey: key) else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    func removeValue<T>(_ value: T, forKey key: String) where T : Decodable, T : Encodable {
        userDefaults.removeObject(forKey: key)
    }
}
