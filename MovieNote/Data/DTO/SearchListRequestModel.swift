//
//  SearchListRequestModel.swift
//  MovieNote
//
//  Created by YOUJIM on 2/6/25.
//


import Foundation

struct SearchListRequestModel: Codable {
    let key: String
    let curPage: String?
    let itemPerPage: String?
    let movieNm: String?
    let directorNm: String?
    let openStartDt: String?
    let openEndDt: String?
    let prdtStartYear: String?
    let prdtEndYear: String?
    let repNationCd: String?
    let movieTypeCd: String?
}
