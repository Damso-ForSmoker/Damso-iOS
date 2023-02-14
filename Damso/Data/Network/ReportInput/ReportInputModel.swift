//
//  ReportInputModel.swift
//  Damso
//
//  Created by 문정호 on 2023/02/10.
//

import Foundation

struct ReportInputModel: Codable{
    var location: String
    var title: String
    var type: Int
    var installAgency: String
    var la: Double
    var lo: Double
    var img: Data?
    
    init(location: String, title: String, type: Int, installAgency: String, img: Data?, la: Double, lo:Double) {
        self.location = location
        self.title = title
        self.type = type
        self.installAgency = installAgency
        self.img = img
        self.la = la
        self.lo = lo
    }
}


