//
//  BookmarkView.swift
//  Damso
//
//  Created by 문정호 on 2023/01/31.
//

import UIKit
import SnapKit
import Then

class BookmarkView: BaseView {
    //MARK: - Properties
    let tableView = UITableView()
    
//    let emptyView = BookmarkIsEmptyView().then{
//        $0.contentMode = .scaleAspectFit
//    }
    
    //MARK: - setUI
    
    override func setupUI(){
        self.addSubview(tableView)
    }
    
    
    //MARK: - setConstraints
    
    override func setConstraints() {
        tableView.snp.makeConstraints{ make in
            make.top.bottom.trailing.leading.equalTo(safeAreaLayoutGuide)
        }
    }


}
