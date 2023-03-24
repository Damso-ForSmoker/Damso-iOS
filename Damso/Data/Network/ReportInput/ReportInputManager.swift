//
//  ReportInputManager.swift
//  Damso
//
//  Created by 문정호 on 2023/02/10.
//

import Foundation
import Alamofire


class ReportInputManager{
    static let reportInputManager = ReportInputManager()
    
    private init() {}
    
    //MARK: - callAPI
    func uploadNewArea(model: ReportInputModel, completion: @escaping (Bool)->Void){
        let url = "http://3.37.122.59:3000/main/facility/register" //url
        
        let header: HTTPHeaders = [
            "Content-Type" : "multipart/form-data" //멀티파트 폼 데이터 형식으로 넘길 것이라는 것을 명시
        ]
        
        AF.upload(multipartFormData: {(MultipartFormData) in
            MultipartFormData.append(Data(model.location.utf8), withName: "location")
            MultipartFormData.append(Data(model.title.utf8), withName: "title")
            MultipartFormData.append(Data(String(model.type).utf8), withName: "type")
            MultipartFormData.append(Data(model.installAgency.utf8), withName: "installAgency")
            MultipartFormData.append(Data(model.la.description.utf8), withName: "la")
            MultipartFormData.append(Data(model.lo.description.utf8), withName: "lo")
            
            if let img = model.uploadfile {
                print(img)
                    MultipartFormData.append(Data(img),
                                             withName: "img.name",
                                             fileName: "\(img).png",
                                             mimeType:"image/png")
            }
        }, to: url,
                  headers: header)
        .validate()
        .responseDecodable(of: ReportInputResult.self) { response in
            
            switch response.result {
            case .success(let result):
                if result.isSuccess{
                    print("업로드 성공")
                    completion(result.isSuccess)
                } else {
                    print(result.message)
                    completion(result.isSuccess)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
