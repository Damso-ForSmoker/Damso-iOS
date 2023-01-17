//
//  ReportView.swift
//  Damso
//
//  Created by 문정호 on 2023/01/17.
//

import UIKit
import NMapsMap
import SnapKit
import Then

class ReportView: BaseView {
    let identifier = "ReportView"

    let view = UIView().then{
        $0.backgroundColor = .white
    }
    
    let mapView = NMFMapView()
    
    override func setupUI() {
        self.addSubview(view)
        self.addSubview(mapView)
    }
    
    override func setConstraints() {
        mapView.snp.makeConstraints{ make in
            make.bottom.top.trailing.leading.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
