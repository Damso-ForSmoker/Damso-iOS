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
    
    let isEmptyView = BookmarkIsEmptyView()
    
    //MARK: - setUI
    
    override func setupUI(){
        self.addSubview(tableView)
        tableView.backgroundView = isEmptyView //엠티 뷰 삽입
        tableView.backgroundView?.isHidden = false
    }
    
    
    //MARK: - setConstraints
    
    override func setConstraints() {
        tableView.snp.makeConstraints{ make in
            make.top.bottom.trailing.leading.equalTo(safeAreaLayoutGuide)
        }
    }


}
