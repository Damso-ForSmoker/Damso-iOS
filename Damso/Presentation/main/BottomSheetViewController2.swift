//
//  BottomSheetViewController2.swift
//  Damso
//
//  Created by 윤채영 on 2023/01/31.
//

import Foundation

import UIKit
// ReportPushViewController
class BottomSheetViewController2: UIViewController {

    @IBAction func reportPush(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let bottomSheetVC = storyboard.instantiateViewController(identifier: "ReportPushViewController")
            // 1
        //let bottomSheet: MDCBottomSheetController  = MDCBottomSheetController(contentViewController: bottomSheetVC)
        
        if let sheet = bottomSheetVC.sheetPresentationController {
          // customize
            sheet.detents = [
                    .custom { context in
                        return context.maximumDetentValue * 0.4
                    }
                ]
            //sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
        }
        
        self.present(bottomSheetVC, animated: false, completion: nil)
    }
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var reviewView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoView.layer.shadowOffset = CGSize(width: 10, height: 10)
        infoView.layer.shadowOpacity = 0.5
        infoView.layer.shadowRadius = 10
        infoView.layer.cornerRadius = 10
        
        reviewView.layer.shadowOffset = CGSize(width: 10, height: 10)
        reviewView.layer.shadowOpacity = 0.5
        reviewView.layer.shadowRadius = 10
        reviewView.layer.cornerRadius = 10
    }
    
}
