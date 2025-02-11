//
//  NetworkError.swift
//  MovieNote
//
//  Created by YOUJIM on 2/10/25.
//


enum NetworkError: Error {
    case noData
    case decodingFailed
    case urlSessionFailed
    case unknown
}
