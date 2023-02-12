//
//  SearchVC.swift
//  Damso
//
//  Created by 문정호 on 2023/02/11.
//

import UIKit

class SearchVC: BaseVC {
    //MARK: - Properties
    let searchView = SearchView()
    let bookmarkCell = SmokingAreaTableViewCell()
    let searchTypeVC = SearchTypeVC()
    
    
    
    //MARK: - LoadView
    override func loadView(){
        view = searchView
    }
    
    //MARK: - Configure
    override func configure(){
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
        searchView.searchButton.action = #selector(setSearchType)
        searchView.searchButton.target = self
        searchView.tableView.register(SmokingAreaTableViewCell.self, forCellReuseIdentifier: SmokingAreaTableViewCell.identifier)
    }
    
    //MARK: - SetNavigationBar
    override func setNavigationBar() {
        self.navigationItem.title = "주변 흡연구역" //네비게이션바 타이틀 설정
        self.navigationItem.rightBarButtonItem = searchView.searchButton // 오른쪽에 검색 버튼
        self.navigationController?.navigationBar.backgroundColor = .white //네비게이션 바 배경 색 설정
    }
    
    @objc func setSearchType(){
        if let sheet = searchTypeVC.sheetPresentationController { //sheet를 띄우는 방식을 컨트롤하는 컨트롤러=
            // customize
            sheet.detents = [ //present하는 범위를 설정
                .custom { _ in
                    return 270 //270만큼 올림
                }]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20 //cornerRadius를 줌
            sheet.prefersGrabberVisible = true //상단의 바를 노출시킴
        }
        self.present(searchTypeVC, animated: true, completion: nil)
    }
}


//MARK: - Extenstion
extension SearchVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = searchView.tableView.dequeueReusableCell(withIdentifier:SmokingAreaTableViewCell.identifier, for: indexPath) as? SmokingAreaTableViewCell else{ return UITableViewCell() }
        return cell
    }
}
