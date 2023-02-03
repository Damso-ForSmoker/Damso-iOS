//
//  BookmarkVC.swift
//  Damso
//
//  Created by 문정호 on 2023/01/31.
//

import UIKit

class BookmarkVC: BaseVC {
    
    let bookmarkView = BookmarkView()
    let bookmarkCell = BookmarkTableViewCell()
    
    override func loadView(){
        view = bookmarkView
    }
    
    override func configure(){
        bookmarkView.tableView.delegate = self
        bookmarkView.tableView.dataSource = self
        
        bookmarkView.tableView.register(BookmarkTableViewCell.self, forCellReuseIdentifier: BookmarkTableViewCell.identifier)
        
    }
    
   override func setNavigationBar() {
        
    }

    
    
}



extension BookmarkVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = bookmarkView.tableView.dequeueReusableCell(withIdentifier:BookmarkTableViewCell.identifier, for: indexPath) as? BookmarkTableViewCell else{ return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension //Cell을 구성하는 높이에 따라 자동으로 조정해줌
    }
    
}
