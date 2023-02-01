//
//  SearchViewController.swift
//  Damso
//
//  Created by 윤채영 on 2023/01/17.
//

import Foundation
import UIKit
//import MaterialComponents.MaterialBottomSheet

class SearchViewController: UIViewController {
    var nextButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .system)
                button.setTitle("Open Filter", for: .normal)
                view.addSubview(button)
                button.translatesAutoresizingMaskIntoConstraints = false
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                
                NSLayoutConstraint.activate([
                    button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])

        
        
    }
    
    @objc func buttonTapped() {
        // 바텀 시트로 쓰일 뷰컨트롤러 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let bottomSheetVC = storyboard.instantiateViewController(identifier: "BottomSheetViewController")
            // 1
        //let bottomSheet: MDCBottomSheetController  = MDCBottomSheetController(contentViewController: bottomSheetVC)
        
        if let sheet = bottomSheetVC.sheetPresentationController {
          // customize
            sheet.detents = [
                    .custom { _ in
                        return 200
                    },
                    .custom { context in
                        return context.maximumDetentValue * 0.6
                    }
                ]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
        }
        
        self.present(bottomSheetVC, animated: false, completion: nil)

    }
            
}
