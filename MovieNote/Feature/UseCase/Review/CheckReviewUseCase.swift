//
//  CheckReviewUseCase.swift
//  MovieNote
//
//  Created by YOUJIM on 2/3/25.
//


import Combine
import Foundation

class CheckReviewUseCase {
    func execute() -> AnyPublisher<[String : Review], Never> {
        if let data = UserDefaults.standard.object(forKey: "ReviewList") as? Data {
            let decoder = JSONDecoder()
            
            if let reviewList = try? decoder.decode([String : Review].self, from: data) {
                return Just(reviewList)
                    .setFailureType(to: Never.self)
                    .eraseToAnyPublisher()
            }
        }
        
        return Just([:])
            .setFailureType(to: Never.self)
            .eraseToAnyPublisher()
    }
}
