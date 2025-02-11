//
//  CheckMovieSearchUseCase.swift
//  MovieNote
//
//  Created by YOUJIM on 2/3/25.
//


import Combine

class CheckMovieSearchUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func execute(keyword: String) -> AnyPublisher<[String], Error> {
        return repository.fetchSearchedMovie(keyword: keyword)
            .eraseToAnyPublisher()
    }
}
