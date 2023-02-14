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
    
    init(from decoder: Decoder) throws { //message가 boolean으로 들어올 경우가 있어서 디코더 throw를 해주어야 함.
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        isSuccess = try container.decode(Bool.self, forKey: .isSuccess)
        code = try container.decode(Int.self, forKey: .code)
        do{
            message = try container.decode(String.self, forKey: .message)
        } catch{
            let booleanInput = try container.decode(Bool.self, forKey: .message)
            message = String(booleanInput)
        }
    }
}
