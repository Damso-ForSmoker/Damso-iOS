//
//  Makers.swift
//  Damso
//
//  Created by 윤채영 on 2023/02/10.
//

import Foundation

// MARK: - Markers
struct Markers: Codable {
    let isSuccess: Bool
    let code: Int
    let message: Bool
    let result: [Pin]
}

// MARK: - Result
struct Pin: Codable {
    let facilityId: Int
    let la, lo: String

    enum CodingKeys: String, CodingKey {
        case facilityId = "facility_id"
        case la, lo
    }
}

// MARK: - DetailSimple
struct DetailSimple: Codable {
    let isSuccess: Bool
    let code: Int
    let message: Bool
    let result: [Simple]
}

// MARK: - Result
struct Simple: Codable {
    let facilityId: Int
    let title, img, report, rating: String

    enum CodingKeys: String, CodingKey {
        case facilityId = "facility_id"
        case title, img, report, rating
    }
}

