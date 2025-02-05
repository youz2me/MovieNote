//
//  MovieRepository.swift
//  MovieNote
//
//  Created by YOUJIM on 2/5/25.
//


import Combine
import Foundation

protocol MovieRepository {
    func fetchDailyBoxOffice(date: Date) -> AnyPublisher<Movie, Error>
    func fetchWeeklyBoxOffice(date: Date) -> AnyPublisher<Movie, Error>
    func fetchSearchedMovie(keyword: String) -> AnyPublisher<Movie, Error>
    func fetchDetailInfo(movieCode: Int) -> AnyPublisher<MovieDetail, Error>
}
