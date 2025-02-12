//
//  JSONCoder.swift
//  MovieNote
//
//  Created by YOUJIM on 2/13/25.
//


import Foundation

final class JSONCoder {
    static let shared = JSONCoder()

    let encoder: JSONEncoder
    let decoder: JSONDecoder

    private init() {
        self.encoder = JSONEncoder()
        self.decoder = JSONDecoder()
    }
}
