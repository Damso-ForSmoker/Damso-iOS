//
//  BottomSheetViewController.swift
//  Damso
//
//  Created by 윤채영 on 2023/01/31.
//

import Foundation
import UIKit


class BottomSheetViewController: UIViewController {

    @IBAction func nextButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "BottomSheetViewController2") as? BottomSheetViewController2 else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    

}
