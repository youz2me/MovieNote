//
//  SearchInfoRequestModel.swift
//  MovieNote
//
//  Created by YOUJIM on 2/6/25.
//


import Foundation

extension DTO.Request {
    struct SearchInfo: Codable {
        let key: String
        let movieCd: String
    }
}
