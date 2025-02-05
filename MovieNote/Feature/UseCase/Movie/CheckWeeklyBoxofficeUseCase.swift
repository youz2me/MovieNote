//
//  CheckWeeklyBoxofficeUseCase.swift
//  MovieNote
//
//  Created by YOUJIM on 2/3/25.
//


import Combine
import Foundation

class CheckWeeklyBoxofficeUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func execute(date: Date) -> AnyPublisher<Movie, Error> {
        return repository.fetchWeeklyBoxOffice(date: date)
            .eraseToAnyPublisher()
    }
}
