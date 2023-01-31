//
//  ReportPushViewController.swift
//  Damso
//
//  Created by 윤채영 on 2023/01/31.
//

import Foundation
import UIKit

//ReportPushViewController

class ReportPushViewController: UIViewController {

    @IBAction func reportComplete(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}

