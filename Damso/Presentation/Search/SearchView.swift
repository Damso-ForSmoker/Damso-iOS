//
//  SearchView.swift
//  Damso
//
//  Created by 문정호 on 2023/02/11.
//

import UIKit
import SnapKit
import Then

class SearchView: BaseView {
    //MARK: - Properties
    let tableView = UITableView() //흡연구역을 표시할 테이블뷰
    let searchButton = UIBarButtonItem().then{
        $0.image = UIImage(named: "SearchIcon")
        $0.tintColor = .black
    }
    
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
