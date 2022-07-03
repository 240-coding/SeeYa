//
//  TicketViewController.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/03.
//

import UIKit

class TicketViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier = "TicketTableViewCell"
    
    // Data
    let titles = ["세븐틴 “BE THE SUN”", "세븐틴 “BE THE SUN”", "워터밤 페스티벌", "NCT127 NEO CITY - the link", "파크 뮤직 페스티벌", "몬테크리스토 뮤지컬", "2022 프로야구 KBO 연습전", "프로야구 정규경기 삼성전"]
    let seat = ["T석", "S석", "일일권", "플로어석", "양일권", "R석", "R-D CLUB석", "다이아몬드석"]
    let seatDetail = ["1열 12석", "3열 4석", "", "", "", "2열 1석", "1열 1석", "2열 1석"]

    override func viewDidLoad() {
        super.viewDidLoad()

        setSearchBar()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func setSearchBar() {
        searchBar.searchTextField.font = UIFont.preferredFont(forTextStyle: .subheadline)
    }

}

extension TicketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TicketTableViewCell else {
            return UITableViewCell()
        }
        let index = indexPath.row
        cell.oppositeEventNameLabel.text = titles[index]
        cell.myEventNameLabel.text = titles[index+1]
        cell.oppositeSeatLabel.text = seat[index]
        cell.mySeatLabel.text = seat[index+1]
        cell.oppositeSeatDetailLabel.text = seatDetail[index]
        cell.mySeatDetailLabel.text = seatDetail[index]
        cell.oppositeImageView.image = UIImage(named: "ticket\(index)")
        cell.myImageView.image = UIImage(named: "ticket\(index+1)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
