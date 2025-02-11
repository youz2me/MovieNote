//
//  SearchInfoResponseModel.swift
//  MovieNote
//
//  Created by YOUJIM on 2/6/25.
//


import Foundation

extension DTO.Response {
    struct SearchInfo: Codable {
        let movieInfoResult: MovieInfoResult
    }
}

struct MovieInfoResult: Codable  {
    let movieInfo: MovieInfo
    let source: String
}

struct MovieInfo: Codable  {
    let movieCd, movieNm, movieNmEn, movieNmOg: String
    let showTm, prdtYear, openDt, prdtStatNm: String
    let typeNm: String
    let nations: [Nation]
    let genres: [Genre]
    let directors: [SearchInfoDirector]
    let actors: [Actor]
    let showTypes: [ShowType]
    let companys: [SearchInfoCompany]
    let audits: [Audit]
    let staffs: [Staff]
}

struct Actor: Codable  {
    let peopleNm, peopleNmEn, cast, castEn: String
}

struct Audit: Codable  {
    let auditNo, watchGradeNm: String
}

struct SearchInfoCompany: Codable  {
    let companyCD, companyNm, companyNmEn, companyPartNm: String
}

struct SearchInfoDirector: Codable  {
    let peopleNm, peopleNmEn: String
}

struct Genre: Codable  {
    let genreNm: String
}

struct Nation: Codable  {
    let nationNm: String
}

struct ShowType: Codable  {
    let showTypeGroupNm, showTypeNm: String
}

struct Staff: Codable  {
    let peopleNm, peopleNmEn, staffRoleNm: String
}
