//
//  ReverseGCModel.swift
//  Damso
//
//  Created by 문정호 on 2023/02/06.
//

import Foundation

//MARK: - ReverseGC
struct RevereGCModel: Codable{
    var status: Status
    var results: [Result]
}

//MARK: - status
struct Status: Codable{
    var code: Int
    var name: String
    var message: String
}

//MARK: - Result
struct Result: Codable{
    var name: String
    var code: Code
    var region: Region
    var land: Land? //Postman 사용했을때 Land가 반환 되지 않는 주소 변환도 있음
}
//MARK: - Code
struct Code: Codable{
    var id: String
    var type:String
    var mappingId: String
}
//MARK: - Region
struct Region: Codable{
    var area0, area1, area2, area3, area4: Area
}
//MARK: - Area
struct Area: Codable{
    var name: String
    var coords:Coords
    
}
//MARK: - Coords
struct Coords: Codable{
    var center:Center
}

//MARK: - Center
struct Center: Codable{
    var crs: String
    var x: Float
    var y: Float
}

//MARK: - Land
struct Land: Codable{
    var type: String?
    var name: String?
    var number1: String
    var number2: String?
    var coords: Coords?
    var addition0,addition1,addition2, addition3, addition4: Addition?
}

//MARK: - Addtion
struct Addition: Codable{
    var type: String
    var value: String
}

struct login: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [loginResult]
}

//token 넘겨줄때 필요한 struct
// MARK: - Result
struct loginResult: Codable {
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
    }
}







