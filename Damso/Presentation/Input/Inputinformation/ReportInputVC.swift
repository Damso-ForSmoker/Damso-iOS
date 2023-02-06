//
//  ReportInputVC.swift
//  Damso
//
//  Created by 문정호 on 2023/01/26.
//

import UIKit

class ReportInputVC: BaseVC {
    
    let reportinputView = ReportInputView()
    var locationString: String?{
        didSet{
            updateLabel(location: locationString)
        }
    }
    
    override func loadView(){
        view = reportinputView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func configure() {
        
    }
    
    override func setNavigationBar() {
        self.navigationItem.title = "흡연구역 제보하기"
    }
    
    
    
    //MARK: - Helper
    func updateLabel(location: String?){
        guard let location = location else {return} //넘어온 값이 있다면 값을 없다면 오류 메시지를 반환
        reportinputView.locationLabel.text = location //위에서 할당한 값을 라벨로 할당
    }

}
