//
//  DailyBoxofficeResponseModel.swift
//  MovieNote
//
//  Created by YOUJIM on 2/6/25.
//


import Foundation

extension DTO.Response {
    struct DailyBoxoffice: Codable {
        let boxOfficeResult: BoxOfficeResult
    }
}

struct BoxOfficeResult: Codable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [BoxOfficeList]
}
