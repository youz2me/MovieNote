//
//  CheckReviewedMovieUseCase.swift
//  MovieNote
//
//  Created by YOUJIM on 2/3/25.
//


import Combine
import Foundation

class CheckReviewedMovieUseCase {
    func execute(movieName: String) -> AnyPublisher<Bool, Never> {
        if let data = UserDefaults.standard.object(forKey: "ReviewList") as? Data {
            let decoder = JSONDecoder()
            
            if let reviewList = try? decoder.decode([String : Review].self, from: data) {
                for (key, _) in reviewList {
                    if key == movieName {
                        return Just(true)
                            .eraseToAnyPublisher()
                    }
                }
            }
        }
        
        return Just(false)
            .eraseToAnyPublisher()
    }
}
