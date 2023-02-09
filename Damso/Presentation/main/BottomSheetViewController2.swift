//
//  BottomSheetViewController2.swift
//  Damso
//
//  Created by 윤채영 on 2023/01/31.
//

import Foundation

import UIKit
import NMapsMap
// ReportPushViewController
class BottomSheetViewController2: UIViewController, UISheetPresentationControllerDelegate {

    @IBAction func dismissButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //@IBOutlet weak var infoView: UIView!
    //@IBOutlet weak var reviewView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        // Do any additional setup after loading the view.
        //let mapView = NMFMapView(frame: view.frame)
        //view.addSubview(mapView)
        
     //   mapView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
      //  mapView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
    }
    
}
