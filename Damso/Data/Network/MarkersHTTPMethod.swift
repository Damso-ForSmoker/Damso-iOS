//
//  MakersHTTPMethod.swift
//  Damso
//
//  Created by 윤채영 on 2023/02/10.
//

import Foundation
import Alamofire
import UIKit
import NMapsMap


class MarkersHTTPMethod{
    static let markersHTTPMethod = MarkersHTTPMethod()
    
    private init() {}
    
    func callPin(completionHandler:@escaping ([Pin])->Void){
        let url = "http://3.37.122.59:3000/main"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).validate().responseDecodable(of: Markers.self){ response in
            switch response.result {
            case .success(let value):
                //print(value)
                
                let marker = NMFMarker()
                var pinInfoArr :Array<Pin> = []
                
                for i in value.result {
                    //marker.position = NMGLatLng(lat: Double(value.result[15].la)!, lng: Double(value.result[15].lo)!)
                    
                    //marker.position = NMGLatLng(lat: Double(i.la)!, lng: Double(i.lo)!)
                    pinInfoArr.append(Pin(facilityId: i.facilityId, la: i.la, lo: i.lo))
                    //print(Double(i.la)!)
                    //print(markerArr)
                    
                    //print(Double(value.result[15].la)!)
                    //print(Double(value.result[15].lo)!)
                    
                }
                completionHandler(pinInfoArr)
                    
                
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}
