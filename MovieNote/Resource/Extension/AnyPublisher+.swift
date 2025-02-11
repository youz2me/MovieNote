//
//  AnyPublisher+.swift
//  MovieNote
//
//  Created by YOUJIM on 2/11/25.
//


import Combine

import Moya

public extension AnyPublisher<Response, MoyaError> {
    func decodeResponse<T: Decodable>() -> AnyPublisher<T, MoyaError> {
        self
            .tryMap {
                do {
                    return try $0.map(T.self)
                }
                catch {
                    throw MoyaError.objectMapping(error, $0)
                }
            }
            .mapError {
                ($0 as? MoyaError) ?? MoyaError.underlying($0, nil)
            }
            .eraseToAnyPublisher()
    }
}
