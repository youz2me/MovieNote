//
//  RecordReviewUseCase.swift
//  MovieNote
//
//  Created by YOUJIM on 2/3/25.
//


import Combine
import Foundation

class RecordReviewUseCase {
    private let repository: ReviewRepository
    
    init(repository: ReviewRepository) {
        self.repository = repository
    }
    
    func execute(movieName: String, review: String) -> AnyPublisher<Bool, any Error> {
        return repository.recordReview(
            key: movieName,
            review: Review(
                contentText: review,
                recordDate: Date()
            )
        )
    }
}
