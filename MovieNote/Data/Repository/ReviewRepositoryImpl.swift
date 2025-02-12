//
//  ReviewRepositoryImpl.swift
//  MovieNote
//
//  Created by YOUJIM on 2/11/25.
//


import Combine

class ReviewService: ReviewRepository {
    private let storage: UserDefaultStorage
    
    init(storage: UserDefaultStorage) {
        self.storage = storage
    }
    
    func fetchReview() -> AnyPublisher<[String : Review], any Error> {
        return Future { promise in
            if let reviewList: [String: Review] = self.storage.getValue(forKey: String.reviewList) {
                promise(.success(reviewList))
            } else {
                promise(.success([:]))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func recordReview(key: String, review: Review) -> AnyPublisher<Bool, any Error> {
        return Future { promise in
            if var reviewList: [String: Review] = self.storage.getValue(forKey: String.reviewList) {
                reviewList.updateValue(review, forKey: key)
                self.storage.setValue(reviewList, forKey: String.reviewList)
                
                promise(.success(true))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func deleteReview(key: String) -> AnyPublisher<Bool, any Error> {
        return Future { promise in
            if var reviewList: [String: Review] = self.storage.getValue(forKey: String.reviewList) {
                reviewList.removeValue(forKey: key)
                self.storage.setValue(reviewList, forKey: String.reviewList)
                
                promise(.success(true))
            }
        }
        .eraseToAnyPublisher()
    }
}
