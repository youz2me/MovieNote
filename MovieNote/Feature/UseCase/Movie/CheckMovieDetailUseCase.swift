//
//  CheckMovieDetailUseCase.swift
//  MovieNote
//
//  Created by YOUJIM on 2/3/25.
//


import Combine

class CheckMovieDetailUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func execute(movieCode: Int) -> AnyPublisher<MovieDetail, Error> {
        return repository.fetchDetailInfo(movieCode: movieCode)
            .eraseToAnyPublisher()
    }
}
