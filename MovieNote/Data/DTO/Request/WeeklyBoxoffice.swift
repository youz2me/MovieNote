//
//  WeeklyBoxofficeRequestModel.swift
//  MovieNote
//
//  Created by YOUJIM on 2/6/25.
//


import Foundation

extension DTO.Request {
    struct WeeklyBoxoffice: Codable {
        let key: String
        let targetDt: String
        let weekGb: String?
        let itemPerPage: String?
        let multiMovieYn: String?
        let repNationCd: String?
        let wideAreaCd: String?
    }
}
