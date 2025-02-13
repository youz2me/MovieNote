//
//  UserDefaultStorage.swift
//  MovieNote
//
//  Created by YOUJIM on 2/11/25.
//


protocol UserDefaultStorage {
    func setValue<T: Codable>(_ value: T, forKey key: String)
    func getValue<T: Codable>(forKey key: String) -> T?
    func removeValue<T: Codable>(_ value: T, forKey key: String)
}
