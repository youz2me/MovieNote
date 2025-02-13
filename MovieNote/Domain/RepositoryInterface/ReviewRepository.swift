//
//  ReviewRepository.swift
//  MovieNote
//
//  Created by YOUJIM on 2/8/25.
//


import Combine
import Foundation

protocol ReviewRepository {
    func fetchReview() -> AnyPublisher<[String : Review], Error>
    func recordReview(key: String, review: Review) -> AnyPublisher<Bool, Error>
    func deleteReview(key: String) -> AnyPublisher<Bool, Error>
}
