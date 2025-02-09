//
//  DailyBoxofficeRequestModel.swift
//  MovieNote
//
//  Created by YOUJIM on 2/6/25.
//


import Foundation

struct DailyBoxofficeRequestModel: Codable {
    let key: String
    let targetDt: String
    let itemPerPage: String?
    let multiMovieYn: String?
    let repNationCd: String?
    let wideAreaCd: String?
}
