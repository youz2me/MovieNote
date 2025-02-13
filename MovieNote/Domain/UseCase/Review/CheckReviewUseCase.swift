//
//  CheckReviewUseCase.swift
//  MovieNote
//
//  Created by YOUJIM on 2/3/25.
//


import Combine
import Foundation

class CheckReviewUseCase {
    private let repository: ReviewRepository
    
    init(repository: ReviewRepository) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[String : Review], any Error> {
        return repository.fetchReview()
    }
}
