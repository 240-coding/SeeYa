//
//  InfoViewController.swift
//  SeeYa
//
//  Created by 이서영 on 2023/03/12.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private let headerTitle = ["시야 확인", "티켓 교환(133)", "예매 사이트"]
    private let headerDescription = ["내 좌석 시야가 어떨지 미리 확인해보세요", "원하는 티켓을 가진 사람과 교환해보세요", "원하는 티켓을 직접 사이트에서 구매하세요"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "InfoHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: InfoHeaderView.identifier)
        
        if #available(iOS 15.0, *) {
          tableView.sectionHeaderTopPadding = 0
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: InfoSeatTableViewCell.cellIdentifier, for: indexPath) as! InfoSeatTableViewCell
        } else if indexPath.section == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: TicketTableViewCell.cellIdentifier, for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: InfoLinkTableViewCell.cellIdentifier, for: indexPath) as! InfoLinkTableViewCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 225
        } else if indexPath.section == 1 {
            return 150
        } else {
            return 100
        }
    }
    
    // Section Header
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: InfoHeaderView.identifier) as! InfoHeaderView
        
        header.titleLabel.text = self.headerTitle[section]
        header.descriptionLabel.text = self.headerDescription[section]
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
}
