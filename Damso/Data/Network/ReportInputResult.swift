//
//  ReportInputResult.swift
//  Damso
//
//  Created by 문정호 on 2023/02/10.
//

import Foundation

struct ReportInputResult: Codable{
    var isSuccess: Bool
    var code: Int
    var message: String
}
