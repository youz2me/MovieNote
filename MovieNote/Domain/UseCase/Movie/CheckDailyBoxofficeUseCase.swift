//
//  CheckDailyBoxofficeUseCase.swift
//  MovieNote
//
//  Created by YOUJIM on 2/3/25.
//


import Combine
import Foundation

class CheckDailyBoxofficeUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func execute(date: Date) -> AnyPublisher<[Movie], Error> {
        return repository.fetchDailyBoxOffice(date: date)
            .eraseToAnyPublisher()
    }
}
