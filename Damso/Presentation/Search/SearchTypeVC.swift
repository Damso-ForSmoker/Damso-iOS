//
//  SearchTypeVC.swift
//  Damso
//
//  Created by 문정호 on 2023/02/12.
//

import UIKit

class SearchTypeVC: BaseVC {
    let searchTypeview = SearchTypeView()
    
    override func loadView() {
        view = self.searchTypeview
    }

}
