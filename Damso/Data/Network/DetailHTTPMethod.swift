//
//  DetailHTTPMethod.swift
//  Damso
//
//  Created by 윤채영 on 2023/02/16.
//

import Foundation
import Alamofire
import UIKit
import NMapsMap

class DetailHTTPMethod{
    static let detailHTTPMethod = DetailHTTPMethod()
    
    private init() {}
    
    func callDetailData(facilityID: Int, completionHandler:@escaping ([Detail])->Void){
        
        let url = "http://3.37.122.59:3000/main/facility/detail/\(facilityID)"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).validate().responseDecodable(of: DetailData.self){ response in
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
