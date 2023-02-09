//
//  Makers.swift
//  Damso
//
//  Created by 윤채영 on 2023/02/10.
//

import Foundation

// MARK: - Welcome
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

