//
//  Bundle+.swift
//  MovieNote
//
//  Created by YOUJIM on 2/10/25.
//


import Foundation

extension Bundle {
    static let keyValue: String = main.object(forInfoDictionaryKey: "KEY_VALUE") as? String ?? ""
}
