//
//  MovieRepositoryImpl.swift
//  MovieNote
//
//  Created by YOUJIM on 2/10/25.
//


import Foundation
import Combine
import CombineMoya

import Moya

class MovieService {
    let provider = MoyaProvider<MovieTargetType>()
    let dateFormatter: DateFormatter

    init() {
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = "yyyyMMdd"
    }
}

extension MovieService: MovieRepository {
    func fetchDailyBoxOffice(date: Date) -> AnyPublisher<[Movie], any Error> {
        return provider.requestPublisher(
            .fetchDailyBoxOffice(
                request: DTO.Request.DailyBoxoffice(
                    key: Bundle.keyValue,
                    targetDt: dateFormatter.string(from: date),
                    itemPerPage: nil,
                    multiMovieYn: nil,
                    repNationCd: nil,
                    wideAreaCd: nil
                )
            )
        )
        .map(\.data)
        .decode(type: DTO.Response.DailyBoxoffice.self, decoder: JSONCoder.shared.decoder)
        .tryMap {
            return $0.boxOfficeResult.dailyBoxOfficeList.map {
                Movie(
                    titleText: $0.movieNm,
                    rankNumber: Int($0.rank) ?? 0
                )
            }
        }
        .eraseToAnyPublisher()
    }
    
    func fetchWeeklyBoxOffice(date: Date) -> AnyPublisher<[Movie], any Error> {
        return provider.requestPublisher(
            .fetchWeeklyBoxOffice(
                request: DTO.Request.WeeklyBoxoffice(
                    key: Bundle.keyValue,
                    targetDt: dateFormatter.string(from: date),
                    weekGb: nil,
                    itemPerPage: nil,
                    multiMovieYn: nil,
                    repNationCd: nil,
                    wideAreaCd: nil
                )
            )
        )
        .map(\.data)
        .decode(type: DTO.Response.WeeklyBoxoffice.self, decoder: JSONCoder.shared.decoder)
        .tryMap {
            return $0.boxOfficeResult.weeklyBoxOfficeList.map {
                Movie(
                    titleText: $0.movieNm,
                    rankNumber: Int($0.rank) ?? 0
                )
            }
        }
        .eraseToAnyPublisher()
    }
    
    func fetchSearchedMovie(keyword: String) -> AnyPublisher<[String], any Error> {
        return provider.requestPublisher(
            .fetchSearchedMovie(
                request: DTO.Request.SearchList(
                    key: Bundle.keyValue,
                    curPage: nil,
                    itemPerPage: nil,
                    movieNm: keyword,
                    directorNm: nil,
                    openStartDt: nil,
                    openEndDt: nil,
                    prdtStartYear: nil,
                    prdtEndYear: nil,
                    repNationCd: nil,
                    movieTypeCd: nil
                )
            )
        )
        .map(\.data)
        .decode(type: DTO.Response.SearchList.self, decoder: JSONCoder.shared.decoder)
        .tryMap {
            return $0.movieListResult.movieList.map {
                $0.movieNm
            }
        }
        .eraseToAnyPublisher()
    }
    
    func fetchDetailInfo(movieCode: Int) -> AnyPublisher<MovieDetail, any Error> {
        return provider.requestPublisher(
            .fetchDetailInfo(
                request: DTO.Request.SearchInfo(
                    key: Bundle.keyValue,
                    movieCd: String(movieCode)
                )
            )
        )
        .map(\.data)
        .decode(type: DTO.Response.SearchInfo.self, decoder: JSONCoder.shared.decoder)
        .tryMap {
            return MovieDetail(
                movieInfo: Movie(
                    titleText: $0.movieInfoResult.movieInfo.movieNm,
                    rankNumber: 0
                ),
                posterURL: URL(string: "https://d3ihz389yobwks.cloudfront.net/1678337490283GRTJk.jpg")!,
                openYearNumber: Int($0.movieInfoResult.movieInfo.openDt.prefix(4))!,
                actorList: $0.movieInfoResult.movieInfo.directors.map {
                    $0.peopleNm
                }
            )
        }
        .eraseToAnyPublisher()
    }
}
