//
//  DetailSimpleHTTPMethod.swift
//  Damso
//
//  Created by 윤채영 on 2023/02/10.
//

import Foundation
import Alamofire
import UIKit
import NMapsMap


class DetailSimpleHTTPMethod{
    static let detailSimpleHTTPMethod = DetailSimpleHTTPMethod()
    
    private init() {}
    
    func callDetail(facilityID: Int, completionHandler:@escaping ([Simple])->Void){
        
        let url = "http://3.37.122.59:3000/main/facility/simple/\(facilityID)"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).validate().responseDecodable(of: DetailSimple.self){ response in
            switch response.result {
            case .success(let value):
                print(value)
                completionHandler(value.result)
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
}
