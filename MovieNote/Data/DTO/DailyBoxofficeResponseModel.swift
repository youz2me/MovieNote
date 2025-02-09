//
//  DailyBoxofficeResponseModel.swift
//  MovieNote
//
//  Created by YOUJIM on 2/6/25.
//


import Foundation

struct DailyBoxofficeResponseModel {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [BoxOfficeList]
}
