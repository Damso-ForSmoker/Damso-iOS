//
//  SearchManager.swift
//  Damso
//
//  Created by 문정호 on 2023/02/16.
//

import Foundation


class SearchManager{
    static let searchManager = SearchManager()
    
    private init() {}
    
//    func callPin(completionHandler:@escaping ([Pin])->Void){
//        let url = "http://3.37.122.59:3000/pin"
//        
//        
//        
//        
//        AF.request(url, method: .get, parameters: nil, headers: nil).validate().responseDecodable(of: Markers.self){ response in
//            switch response.result {
//            case .success(let value):
//                //print(value)
//                completionHandler(value.result)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
}
