//
//  GeocodingManager.swift
//  Damso
//
//  Created by 문정호 on 2023/02/06.
//

import Foundation
import Alamofire
import SwiftyJSON

class GeocodingManager{
    //MARK: - Properties
    static let geocodingManager = GeocodingManager()
    
    //MARK: - init
    private init() {} //Singleton 패턴을 사용하여 클래스 초기화는 한번만 되도록 사용
    
    
    //MARK: - callAPI
    func callReversedGeocoding(lon: String, lat: String, completionHandler: @escaping (String)->Void) {
        var addressString = ""
        let url = "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc"
        let header: HTTPHeaders = [
            "X-NCP-APIGW-API-KEY-ID" : Keys.naverClientID,
            "X-NCP-APIGW-API-KEY" : Keys.naverClientSecret
        ]
        let para: Parameters = [
            "coords": "\(lon),\(lat)", // 쿼리
            "output": "json", // 디폴트가 xml이라 Json로 넘겨줘야함
            "orders": "legalcode,admcode,addr,roadaddr" // 좌표 -> 도로명주소 변환
        ]
        

        AF.request(url,
                   method: .get,
                   parameters: para,
                   headers: header)
        .validate()
        .responseDecodable(of: RevereGCModel.self,
                           queue: .global()) { response in
            
            switch response.result {
            case .success(let value):
                if !value.results.isEmpty {
                    let address = value.results[0].region
//                    let detail = value.results[0].land
                    
                    if value.results.count == 4 {//모든 주소가 나오는 좌표라면 도로명 주소를 출력
                      addressString = "\(address.area1.name) \(address.area2.name)" //시/도 + 시/군/구
                        if let name = value.results[3].land?.name {
                          addressString = "\(addressString) \(name)"
                      }
                      
                        if let roadNumber1 = value.results[3].land?.number1 {
                          addressString = "\(addressString) \(roadNumber1)"
                        
                            if let roadNumber2 = value.results[3].land?.number2 {
                                if !roadNumber2.isEmpty {
                                    addressString = "\(addressString)-\(roadNumber2)"
                          }
                        }
                      }
                    } else {
                      addressString = "\(address.area1.name) \(address.area2.name) \(address.area3.name)"
                      
                        if value.results.count > 2 {
                            if let detail1 = value.results[2].land?.number1 {
                            addressString = "\(addressString) \(detail1)"
                          
                                if let detail2 = value.results[2].land?.number2{
                                   if !detail2.isEmpty {
                                     addressString = "\(addressString)-\(detail2)"
                                }
                          }
                        }
                      }
                    }
                    completionHandler(addressString)
                } else {
                    completionHandler("주소가 없는 좌표입니다.")
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
