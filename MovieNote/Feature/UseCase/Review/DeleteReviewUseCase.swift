//
//  DeleteReviewUseCase.swift
//  MovieNote
//
//  Created by YOUJIM on 2/3/25.
//


import Combine
import Foundation

class DeleteReviewUseCase {
    func execute(movieName: String) -> AnyPublisher<Bool, Never> {
        if let data = UserDefaults.standard.object(forKey: "ReviewList") as? Data {
            let decoder = JSONDecoder()
            
            if var reviewList = try? decoder.decode([String : Review].self, from: data) {
                if reviewList.keys.contains(movieName) {
                    let encoder = JSONEncoder()
                    
                    reviewList.removeValue(forKey: movieName)
                    
                    if let updatedReviewList = try? encoder.encode(reviewList) {
                        UserDefaults.standard.set(updatedReviewList, forKey: "ReviewList")
                        
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
