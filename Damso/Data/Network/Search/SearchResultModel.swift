//
//  SearchResultModel.swift
//  Damso
//
//  Created by 문정호 on 2023/02/16.
//

import Foundation

struct SearchResultModel: Codable{
    var facilityId: Int
    var title: String
    var location: String
    var rating: Double
    var img: Data?
}
