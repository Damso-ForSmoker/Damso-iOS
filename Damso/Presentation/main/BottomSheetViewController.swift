//
//  BottomSheetViewController.swift
//  Damso
//
//  Created by 윤채영 on 2023/01/31.
//

import Foundation
import UIKit



class BottomSheetViewController: UIViewController {
    //MARK: - Properties
    

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var FacilityImg: UIImageView!
    @IBOutlet weak var isUserReport: UILabel!
    
    var titleText:String?
    var gradeText:String?
    lazy var userReportArea: String = ""
    var fID: Int?
    var id: Int = 0
    var lat: String?
    var lng: String?
    var lat1: String = ""
    var lng1: String = ""
    
    
    
    override func viewDidLoad(){

        updateTitle(string: titleText)
        updateGrade(string: gradeText)
        setUserReportLabel(string: userReportArea)
        //titleLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    
    //MARK: - 
    @IBAction func nextButton(_ sender: Any) {

        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "BottomSheetViewController2") as? BottomSheetViewController2 else {return}
        nextVC.modalPresentationStyle = .fullScreen
        
        self.lat1 = lat!
        self.lng1 = lng!
        self.id = fID!
        //print(lat1)
        
        let label1 = titleText
        nextVC.titleText = label1
        nextVC.lat = lat1
        nextVC.lng = lng1
        nextVC.fID = id

        self.present(nextVC, animated: true, completion: nil)
        
    }
    
    
    //MARK: - Helper
    
    func updateGrade(string:String?) {
        guard let string = string else {return}
        self.gradeLabel?.text = string
        
    }
    
    func updateTitle(string: String?){
        guard let string = string else {return}
        self.titleLabel?.text = string
    }
    func setUserReportLabel(string: String){
        if string == "N"{
            isUserReport.isHidden = true
        } else{
            isUserReport.isHidden = false
        }
    }

}
