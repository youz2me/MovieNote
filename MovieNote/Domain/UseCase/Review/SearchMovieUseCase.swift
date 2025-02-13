//
//  SearchMovieUseCase.swift
//  MovieNote
//
//  Created by YOUJIM on 2/3/25.
//


import Combine
import Foundation

class SearchMovieUseCase {
    private let repository: ReviewRepository
    
    init(repository: ReviewRepository) {
        self.repository = repository
    }
    
    func execute(movieName: String) -> AnyPublisher<Bool, any Error> {
        return repository.fetchReview()
            .tryMap { reviewList in
                reviewList.keys.contains(movieName)
            }
            .eraseToAnyPublisher()
    }
}
