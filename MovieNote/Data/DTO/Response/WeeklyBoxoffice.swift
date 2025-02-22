//
//  WeeklyBoxofficeResponseModel.swift
//  MovieNote
//
//  Created by YOUJIM on 2/6/25.
//


import Foundation

extension DTO.Response {
    struct WeeklyBoxoffice: Codable {
        let boxOfficeResult: WeeklyBoxOfficeResult
    }
    
    struct WeeklyBoxOfficeResult: Codable {
        let boxofficeType, showRange, yearWeekTime: String
        let weeklyBoxOfficeList: [BoxOfficeList]
    }

    struct BoxOfficeList: Codable {
        let rnum, rank, rankInten, rankOldAndNew: String
        let movieCd, movieNm, openDt: String
        let salesAmt, salesShare, salesInten, salesChange, salesAcc: String
        let audiCnt, audiInten, audiChange, audiAcc: String
        let scrnCnt, showCnt: String
    }
}

