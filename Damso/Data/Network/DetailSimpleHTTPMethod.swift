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
    
    func callDetail(facilityID: Int, completionHandler:@escaping ([NMFMarker])->Void){
        let url = "http://3.37.122.59:3000/main/facility/simple/{\(facilityID)}"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).validate().responseDecodable(of: DetailSimple.self){ response in
            switch response.result {
            case .success(let value):
                print(value)
                
                let marker = NMFMarker()
                var markerArr :Array<NMFMarker> = []
                
                for i in value.result {
                    //marker.position = NMGLatLng(lat: Double(value.result[15].la)!, lng: Double(value.result[15].lo)!)
                    
                    //marker.position = NMGLatLng(lat: Double(i.la)!, lng: Double(i.lo)!)
                    //markerArr.append(NMFMarker(position: NMGLatLng(lat: Double(i.la)!, lng: Double(i.lo)!)))
                    //print(Double(i.la)!)
                    //print(markerArr)
                    
                    //print(Double(value.result[15].la)!)
                    //print(Double(value.result[15].lo)!)
                    
                }
                completionHandler(markerArr)
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}
