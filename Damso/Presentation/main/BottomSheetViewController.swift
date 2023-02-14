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
    
    var titleText:String?
    var gradeText:String?
    
    override func viewDidLoad(){
        updateTitle(string: titleText)
        updateGrade(string: gradeText)
        titleLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    //MARK: - 
    @IBAction func nextButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "BottomSheetViewController2") as? BottomSheetViewController2 else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
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
    
    

}
