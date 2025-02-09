//
//  SearchInfoResponseModel.swift
//  MovieNote
//
//  Created by YOUJIM on 2/6/25.
//


import Foundation

struct SearchInfoResponseModel {
    let movieInfoResult: MovieInfoResult
}

struct MovieInfoResult {
    let movieInfo: MovieInfo
    let source: String
}

struct MovieInfo {
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

struct Actor {
    let peopleNm, peopleNmEn, cast, castEn: String
}

struct Audit {
    let auditNo, watchGradeNm: String
}

struct SearchInfoCompany {
    let companyCD, companyNm, companyNmEn, companyPartNm: String
}

struct SearchInfoDirector {
    let peopleNm, peopleNmEn: String
}

struct Genre {
    let genreNm: String
}

struct Nation {
    let nationNm: String
}

struct ShowType {
    let showTypeGroupNm, showTypeNm: String
}

struct Staff {
    let peopleNm, peopleNmEn, staffRoleNm: String
}
