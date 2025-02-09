//
//  SearchListResponseModel.swift
//  MovieNote
//
//  Created by YOUJIM on 2/6/25.
//


import Foundation

struct SearchListResponseModel {
    let movieListResult: MovieListResult
}

struct MovieListResult {
    let totCnt: Int
    let source: String
    let movieList: [MovieList]
}

struct MovieList {
    let movieCd, movieNm, movieNmEn, prdtYear: String
    let openDt: String
    let typeNm: String
    let prdtStatNm: String
    let nationAlt: String
    let genreAlt: String
    let repNationNm: String
    let repGenreNm: String
    let directors: [SearchListDirector]
    let companys: [SearchListCompany]
}

struct SearchListCompany {
    let companyCD, companyNm: String
}

struct SearchListDirector {
    let peopleNm: String
}
