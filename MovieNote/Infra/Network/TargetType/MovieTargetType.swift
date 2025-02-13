//
//  MovieTargetType.swift
//  MovieNote
//
//  Created by YOUJIM on 2/9/25.
//


import Foundation

import Moya

enum MovieTargetType {
    case fetchDailyBoxOffice(request: DTO.Request.DailyBoxoffice)
    case fetchWeeklyBoxOffice(request: DTO.Request.WeeklyBoxoffice)
    case fetchSearchedMovie(request: DTO.Request.SearchList)
    case fetchDetailInfo(request: DTO.Request.SearchInfo)
}

extension MovieTargetType: TargetType {
    var baseURL: URL {
        guard let urlString = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String,
              let url = URL(string: urlString)
        else {
            fatalError("BASE_URL을 찾을 수 없습니다.")
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .fetchDailyBoxOffice:
            return "/boxoffice/searchDailyBoxOfficeList.json"
        case .fetchWeeklyBoxOffice:
            return "/boxoffice/searchDailyBoxOfficeList.json"
        case .fetchSearchedMovie:
            return "/movie/searchMovieList.json"
        case .fetchDetailInfo:
            return "/movie/searchMovieInfo.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchDailyBoxOffice(let request):
            return .requestJSONEncodable(request)
        case .fetchWeeklyBoxOffice(let request):
            return .requestJSONEncodable(request)
        case .fetchSearchedMovie(let request):
            return .requestJSONEncodable(request)
        case .fetchDetailInfo(let request):
            return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }

}
