//
//  DailyBoxofficeResponseModel.swift
//  MovieNote
//
//  Created by YOUJIM on 2/6/25.
//


import Foundation

extension DTO.Response {
    struct DailyBoxoffice: Codable {
        let boxOfficeResult: DailyBoxOfficeResult
    }
    
    struct DailyBoxOfficeResult: Codable {
        let boxofficeType, showRange: String
        let dailyBoxOfficeList: [BoxOfficeList]
    }
}
