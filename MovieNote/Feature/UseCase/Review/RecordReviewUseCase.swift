//
//  RecordReviewUseCase.swift
//  MovieNote
//
//  Created by YOUJIM on 2/3/25.
//


import Combine
import Foundation

class RecordReviewUseCase {
    func execute(movieName: String, review: String) -> AnyPublisher<Bool, Never> {
        if let data = UserDefaults.standard.object(forKey: "ReviewList") as? Data {
            let decoder = JSONDecoder()
            
            if var reviewList = try? decoder.decode([String : Review].self, from: data) {
                let review = Review(contentText: review,
                                    recordDate: Date())
                
                reviewList.updateValue(review, forKey: movieName)
                
                return Just(true)
                    .eraseToAnyPublisher()
            }
        }
        
        return Just(false)
            .eraseToAnyPublisher()
    }
}
